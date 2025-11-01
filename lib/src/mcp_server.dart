import "dart:async";
import "dart:convert";
import "dart:io";

import "package:dart_mcp/server.dart";
import "package:path/path.dart" as p;
import "package:vsc_tasks_mcp/src/logger.dart";
import "package:vsc_tasks_mcp/src/metadata.dart";
import "package:vsc_tasks_mcp/src/task/task_definition.dart";
import "package:vsc_tasks_mcp/src/task/task_definitions.dart";
import "package:vsc_tasks_mcp/src/task_executor.dart";

/// VSCode tasks.json用のMCPサーバー実装
final class VscTasksJsonServer extends MCPServer with ToolsSupport {
  /// プロジェクトルートディレクトリ
  final Directory projectRoot;

  /// サーバー用のLogger.
  /// NOTE.
  /// 各タスクは別途Loggerを作成して使用する.
  late final Logger logger;

  VscTasksJsonServer.fromStreamChannel(
    super.channel, {
    required this.projectRoot,
    required super.implementation,
    required this.logger,
    super.instructions,
    StreamSink<String>? super.protocolLogSink,
  }) : super.fromStreamChannel() {
    // サーバー起動ログ
    logger.info("MCP Server started");
    logger.info("Project root: $projectRoot");
  }

  @override
  Future<InitializeResult> initialize(InitializeRequest request) async {
    // tasks.jsonをまだ読み込んでいない場合は読み込む
    final tasks = await _loadTasks();
    logger.info("Loaded ${tasks.length} tasks");
    for (final task in tasks) {
      logger.info("  - task: ${task.mcpOptions.tool}");
    }

    // options.mcpが定義されているタスクのみを個別ツールとして登録
    for (final task in tasks) {
      final mcpOptions = task.mcpOptions;

      // 入力スキーマを生成
      final inputSchema = _createInputSchema(task);

      // ツールを登録
      registerTool(
        Tool(
          name: mcpOptions.tool,
          description: mcpOptions.description ?? task.label,
          inputSchema: inputSchema,
        ),
        (toolRequest) => _handleTaskExecution(toolRequest),
      );

      logger.info("Registered: ${mcpOptions.tool}");
      logger.info("  - mcpOptions.description: ${mcpOptions.description}");
    }

    return super.initialize(request);
  }

  /// タスクから入力スキーマを生成する
  ObjectSchema _createInputSchema(TaskDefinition task) {
    final properties = <String, Schema>{};
    final required = <String>[];

    for (final variable in task.requiredVariables) {
      if (variable.startsWith("input:")) {
        // input:xxx形式の変数
        final name = variable.substring(6); // "input:"を削除
        properties[name] = StringSchema(description: "$nameを指定");
        required.add(name);
      } else if (variable == "file") {
        // file変数
        properties["file"] = StringSchema(description: "ファイルパスを指定");
        required.add("file");
      }
    }

    return ObjectSchema(
      properties: properties,
      required: required.isNotEmpty ? required : null,
    );
  }

  /// タスク実行を処理する
  Future<CallToolResult> _handleTaskExecution(
    CallToolRequest request,
  ) async {
    logger.info("Executing tool: ${request.name}");
    final arguments = request.arguments ?? {};
    final tasks = await _loadTasks();
    final task = tasks.firstWhere(
      (task) => task.mcpOptions.tool == request.name,
    );

    // ツール用ロガーを作成
    final toolLogger = Logger(
      packageName: mcpName,
      projectRoot: projectRoot,
      name: request.name,
    );
    // 変数マップを構築
    final variablesMap = <String, String>{};
    final file = arguments["file"] as String?;
    for (final variable in task.requiredVariables) {
      if (variable.startsWith("input:")) {
        final name = variable.substring(6);
        final value = arguments[name] as String?;
        if (value != null) {
          variablesMap[name] = value;
        }
      }
    }

    try {
      final executor = TaskExecutor(projectRoot: projectRoot);
      final result = await executor.execute(
        task,
        variables: variablesMap.isNotEmpty ? variablesMap : null,
        file: file,
        logger: toolLogger,
      );

      // 実行完了をログに記録
      toolLogger.info("Exit code: ${result.exitCode}");

      logger.info(
        "Tool ${request.name} completed with exit code: ${result.exitCode}",
      );

      // レスポンスを作成
      final responseData = {
        ...result.toJson(),
        "logFile": toolLogger.file.path,
      };

      return CallToolResult(
        content: [
          TextContent(text: jsonEncode(responseData)),
        ],
      );
    } on Exception catch (e, stackTrace) {
      toolLogger.error("Task execution failed: $e", stackTrace: stackTrace);
      logger.error("Tool ${request.name} failed: $e");

      return CallToolResult(
        isError: true,
        content: [
          TextContent(
            text: jsonEncode({
              "error": e.toString(),
              "logFile": toolLogger.file.path,
            }),
          ),
        ],
      );
    }
  }

  /// tasks.jsonを読み込む
  Future<TaskDefinitions> _loadTasks() async {
    try {
      final tasksJsonFile = File(
        p.join(projectRoot.path, ".vscode", "tasks.json"),
      );
      logger.info("Loading tasks.json: ${tasksJsonFile.path}");
      return TaskDefinitions.fromTaskJson(tasksJsonFile);
    } on Exception catch (e, stackTrace) {
      logger.error(
        "Error loading tasks.json: $e",
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
