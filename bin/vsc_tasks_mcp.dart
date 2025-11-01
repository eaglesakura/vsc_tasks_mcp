import "dart:io";

import "package:dart_mcp/server.dart";
import "package:dart_mcp/stdio.dart";
import "package:path/path.dart" as p;
import "package:vsc_tasks_mcp/src/logger.dart";
import "package:vsc_tasks_mcp/src/mcp_server.dart";
import "package:vsc_tasks_mcp/src/metadata.dart";

/// MCPサーバーのエントリーポイント
Future<void> main() async {
  // プロジェクトルートを取得
  stderr.writeln("Finding project root...");
  stderr.writeln("  - cd: ${Directory.current.path}");
  final projectRoot = _findProjectRoot();
  final serverLogger = Logger(
    projectRoot: projectRoot,
    packageName: mcpName,
    name: "server",
  );
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
      name: mcpName,
      version: mcpVersion,
      title: mcpTitle,
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
