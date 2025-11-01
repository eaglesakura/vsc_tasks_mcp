import "dart:io";

import "package:dart_mcp/server.dart";
import "package:dart_mcp/stdio.dart";
import "package:path/path.dart" as p;
import "package:vsc_tasks_json/src/logger.dart";
import "package:vsc_tasks_json/src/mcp_server.dart";

/// MCPサーバーのエントリーポイント
Future<void> main() async {
  // プロジェクトルートを取得
  final projectRoot = _findProjectRoot();
  final serverLogger = Logger(
    projectRoot: projectRoot,
    packageName: "vsc_tasks_json",
    name: "mcp_server",
  );
  serverLogger.info("Finding project root...");
  serverLogger.info("  - cd: ${Directory.current.path}");
  serverLogger.info("  - project: $projectRoot");

  // stdioチャネルを作成
  final channel = stdioChannel(
    input: stdin,
    output: stdout,
  );

  // MCPサーバーを作成
  final server = VscTasksJsonServer.fromStreamChannel(
    channel,
    projectRoot: projectRoot,
    implementation: Implementation(
      name: "vsc_tasks_json",
      version: "1.0.0",
      title: "VSCode `tasks.json` MCP Server",
    ),
    logger: serverLogger,
  );

  // サーバーが終了するまで待機
  await server.done;
}

/// プロジェクトルートを見つける
Directory _findProjectRoot() {
  // まずカレントディレクトリから検索
  var current = Directory.current;

  // 最大10階層まで上を探す
  for (var i = 0; i < 10; i++) {
    final tasksJsonPath = p.join(current.path, ".vscode", "tasks.json");
    if (File(tasksJsonPath).existsSync()) {
      return current;
    }
    current = current.parent;
  }

  // 見つからなければカレントディレクトリを返す
  return Directory.current;
}
