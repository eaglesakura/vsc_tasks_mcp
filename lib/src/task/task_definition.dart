import "package:meta/meta.dart";
import "package:vsc_tasks_mcp/src/task/mcp_options.dart";

/// tasks.jsonで定義されているタスクの定義
@internal
class TaskDefinition {
  /// タスクのラベル
  final String label;

  /// 実行するコマンド
  final String command;

  /// コマンドの引数リスト
  final List<String> args;

  /// このタスクで必要な変数のリスト
  /// 例: ["input:platform", "input:flavor", "file"]
  final List<String> requiredVariables;

  /// MCPツール設定（options.mcp）
  final McpOptions mcpOptions;

  const TaskDefinition({
    required this.label,
    required this.command,
    required this.args,
    required this.requiredVariables,
    required this.mcpOptions,
  });
}
