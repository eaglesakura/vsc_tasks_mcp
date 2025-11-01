import "dart:convert";
import "dart:io";

import "package:meta/meta.dart";
import "package:vsc_tasks_mcp/src/parser/dto/input_definition_dto.dart";
import "package:vsc_tasks_mcp/src/parser/dto/mcp_options_dto.dart";
import "package:vsc_tasks_mcp/src/parser/dto/task_definition_dto.dart";
import "package:vsc_tasks_mcp/src/parser/dto/tasks_json_dto.dart";
import "package:vsc_tasks_mcp/src/task/input_definition.dart";
import "package:vsc_tasks_mcp/src/task/mcp_options.dart";
import "package:vsc_tasks_mcp/src/task/task_definition.dart";

/// tasks.jsonをパースするクラス
@internal
class TasksJsonParser {
  /// パースされたタスクのリスト
  final tasks = <TaskDefinition>[];

  /// パースされたinputのマップ
  final inputs = <String, InputDefinition>{};

  TasksJsonParser.fromFile(File file) {
    if (!file.existsSync()) {
      throw Exception("tasks.json not found: ${file.path}");
    }

    _parse(file);
  }

  /// InputDefinitionDto からドメインモデルに変換
  InputDefinition _convertInput(InputDefinitionDto inputDto) {
    final parsedOptions = <String>[];
    if (inputDto.options != null) {
      for (final option in inputDto.options!) {
        if (option is String) {
          parsedOptions.add(option);
        } else if (option is Map<String, dynamic> &&
            option.containsKey("value")) {
          parsedOptions.add(option["value"] as String);
        }
      }
    }

    return InputDefinition(
      id: inputDto.id,
      description: inputDto.description ?? "",
      type: inputDto.type ?? "promptString",
      options: parsedOptions,
    );
  }

  /// McpOptionsDto からドメインモデルに変換
  McpOptions _convertMcpOptions(McpOptionsDto dto) {
    return McpOptions(
      tool: dto.tool,
      description: dto.description,
    );
  }

  /// TaskDefinitionDto からドメインモデルに変換
  /// McpOptions がない場合は null を返す
  TaskDefinition? _convertTask(TaskDefinitionDto taskDto) {
    final argsValue = taskDto.args ?? [];
    final requiredVariables = _extractVariables(taskDto.command, argsValue);

    McpOptions? mcpOptions;
    if (taskDto.options != null && taskDto.options!.containsKey("mcp")) {
      final mcpMap = taskDto.options!["mcp"] as Map<String, dynamic>?;
      if (mcpMap != null) {
        try {
          final mcpDto = McpOptionsDto.fromJson(mcpMap);
          mcpOptions = _convertMcpOptions(mcpDto);
        } catch (_) {
          // パースに失敗した場合は無視
        }
      }
    }

    // McpOptions がない場合は null を返す
    if (mcpOptions == null) {
      return null;
    }

    return TaskDefinition(
      label: taskDto.label,
      command: taskDto.command,
      args: argsValue,
      requiredVariables: requiredVariables,
      mcpOptions: mcpOptions,
    );
  }

  /// コマンドと引数から必要な変数を抽出する
  List<String> _extractVariables(String command, List<String> args) {
    final variables = <String>{};
    final inputPattern = RegExp(r"\$\{input:([^}]+)\}");
    final filePattern = RegExp(r"\$\{file\}");

    // コマンドから変数を抽出
    for (final match in inputPattern.allMatches(command)) {
      variables.add("input:${match.group(1)}");
    }
    if (filePattern.hasMatch(command)) {
      variables.add("file");
    }

    // 引数から変数を抽出
    for (final arg in args) {
      for (final match in inputPattern.allMatches(arg)) {
        variables.add("input:${match.group(1)}");
      }
      if (filePattern.hasMatch(arg)) {
        variables.add("file");
      }
    }

    return variables.toList();
  }

  /// tasks.jsonを読み込み、パースする
  void _parse(File tasksJsonFile) {
    var content = tasksJsonFile.readAsStringSync();

    // トレーリングカンマを削除（VSCodeのtasks.jsonは許可しているが、標準JSONでは無効）
    content = _removeTrailingCommas(content);

    final Map<String, dynamic> json;
    try {
      json = jsonDecode(content) as Map<String, dynamic>;
    } on FormatException catch (e) {
      throw Exception("tasks.jsonのパースに失敗しました: ${e.message}");
    }

    final tasksJsonDto = TasksJsonDto.fromJson(json);

    // inputsをパース
    inputs.clear();
    tasksJsonDto.inputs?.forEach((inputDto) {
      inputs[inputDto.id] = _convertInput(inputDto);
    });

    // tasksをパース（McpOptionsがあるもののみ）
    tasks.clear();
    tasksJsonDto.tasks?.forEach((taskDto) {
      final task = _convertTask(taskDto);
      if (task != null) {
        tasks.add(task);
      }
    });
  }

  /// トレーリングカンマを削除する
  String _removeTrailingCommas(String json) {
    // ,\s*} のパターンを } に置換
    // ,\s*] のパターンを ] に置換
    return json
        .replaceAll(RegExp(r",\s*}"), "}")
        .replaceAll(RegExp(r",\s*]"), "]");
  }
}
