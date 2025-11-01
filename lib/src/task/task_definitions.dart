import "dart:io";

import "package:meta/meta.dart";
import "package:vsc_tasks_mcp/src/parser/tasks_json_parser.dart";
import "package:vsc_tasks_mcp/src/task/task_definition.dart";

/// タスク一覧.
@internal
extension type const TaskDefinitions._(List<TaskDefinition> _value)
    implements List<TaskDefinition> {
  /// `tasks.json` からタスク一覧を取得する
  factory TaskDefinitions.fromTaskJson(File file) {
    if (!file.existsSync()) {
      throw Exception("tasks.json not found: ${file.path}");
    }

    final parser = TasksJsonParser.fromFile(file);
    return TaskDefinitions._([...parser.tasks]);
  }
}
