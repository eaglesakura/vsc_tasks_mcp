import "dart:io";

import "package:test/test.dart";
import "package:vsc_tasks_mcp/src/task/task_definitions.dart";

void main() {
  group("TaskDefinitions.fromTaskJson", () {
    test("tasks.json をパースできること", () {
      final file = File("test/fixtures/tasks.json");
      final definitions = TaskDefinitions.fromTaskJson(file);

      // McpOptions があるタスクのみが含まれる
      expect(definitions.length, 1);
    });

    test("McpOptions のあるタスクが認識されること", () {
      final file = File("test/fixtures/tasks.json");
      final definitions = TaskDefinitions.fromTaskJson(file);

      final taskWithMcp = definitions.firstWhere(
        (task) => task.label == "Task with MCP",
      );

      expect(taskWithMcp.mcpOptions, isNotNull);
      expect(taskWithMcp.mcpOptions.tool, "test_tool");
      expect(taskWithMcp.mcpOptions.description, "Test tool description");
    });

    test("McpOptions のないタスクはスキップされること", () {
      final file = File("test/fixtures/tasks.json");
      final definitions = TaskDefinitions.fromTaskJson(file);

      // McpOptions のないタスクは含まれない
      final hasTaskWithoutMcp = definitions.any(
        (task) => task.label == "Task without MCP",
      );

      expect(hasTaskWithoutMcp, isFalse);
    });

    test("タスクの基本情報が正しくパースされること", () {
      final file = File("test/fixtures/tasks.json");
      final definitions = TaskDefinitions.fromTaskJson(file);

      final taskWithMcp = definitions.firstWhere(
        (task) => task.label == "Task with MCP",
      );

      expect(taskWithMcp.label, "Task with MCP");
      expect(taskWithMcp.command, "echo");
      expect(taskWithMcp.args, ["Hello MCP"]);
    });

    test("存在しないファイルの場合は例外が発生すること", () {
      final file = File("test/fixtures/nonexistent.json");

      expect(
        () => TaskDefinitions.fromTaskJson(file),
        throwsA(isA<Exception>()),
      );
    });
  });
}
