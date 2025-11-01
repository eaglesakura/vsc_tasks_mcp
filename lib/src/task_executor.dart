import "dart:convert";
import "dart:io";

import "package:vsc_tasks_mcp/src/logger.dart";
import "package:vsc_tasks_mcp/src/task/task_definition.dart";

/// タスク実行の結果
class TaskExecutionResult {
  /// 終了コード
  final int exitCode;

  /// 標準出力
  final String stdout;

  /// 標準エラー出力
  final String stderr;

  /// 実行したコマンド（変数置換後）
  final String command;

  const TaskExecutionResult({
    required this.exitCode,
    required this.stdout,
    required this.stderr,
    required this.command,
  });

  /// JSONに変換する
  Map<String, dynamic> toJson() {
    return {
      "exitCode": exitCode,
      "stdout": stdout,
      "stderr": stderr,
      "command": command,
    };
  }
}

/// タスクを実行するクラス
class TaskExecutor {
  /// プロジェクトルートディレクトリ
  final Directory projectRoot;

  const TaskExecutor({required this.projectRoot});

  /// タスクを実行する
  Future<TaskExecutionResult> execute(
    TaskDefinition task, {
    Map<String, String>? variables,
    String? file,
    Logger? logger,
  }) async {
    // 変数を置換
    final command = _substituteVariables(task.command, variables, file);
    final args = task.args
        .map((arg) => _substituteVariables(arg, variables, file))
        .toList();

    // 必要な変数が提供されているか確認
    _validateVariables(task, variables, file);

    // 実行コマンド文字列を構築
    final commandString = [command, ...args].join(" ");

    // タスクを実行
    try {
      // Process.start()を使用してリアルタイム出力を実現
      final process = await Process.start(
        command,
        args,
        workingDirectory: projectRoot.path,
        runInShell: true,
      );

      // stdoutをリッスン
      final stdoutBuffer = StringBuffer();
      process.stdout.transform(utf8.decoder).listen((data) {
        stdoutBuffer.write(data);
        logger?.writeRaw(data); // リアルタイムでログに書き込み
      });

      // stderrをリッスン
      final stderrBuffer = StringBuffer();
      process.stderr.transform(utf8.decoder).listen((data) {
        stderrBuffer.write(data);
        logger?.writeRaw(data); // リアルタイムでログに書き込み
      });

      // プロセスの終了を待つ
      final exitCode = await process.exitCode;

      return TaskExecutionResult(
        exitCode: exitCode,
        stdout: stdoutBuffer.toString(),
        stderr: stderrBuffer.toString(),
        command: commandString,
      );
    } on ProcessException catch (e) {
      throw Exception("コマンドの実行に失敗しました: ${e.message}");
    }
  }

  /// 変数を置換する
  String _substituteVariables(
    String text,
    Map<String, String>? variables,
    String? file,
  ) {
    var result = text;

    // ${input:xxx}を置換
    if (variables != null) {
      final inputPattern = RegExp(r"\$\{input:([^}]+)\}");
      result = result.replaceAllMapped(inputPattern, (match) {
        final varName = match.group(1)!;
        if (variables.containsKey(varName)) {
          return variables[varName]!;
        }
        // 変数が見つからない場合は置換しない（後でバリデーションエラーになる）
        return match.group(0)!;
      });
    }

    // ${file}を置換
    if (file != null) {
      result = result.replaceAll(r"${file}", file);
    }

    return result;
  }

  /// 必要な変数が提供されているか確認する
  void _validateVariables(
    TaskDefinition task,
    Map<String, String>? variables,
    String? file,
  ) {
    for (final requiredVar in task.requiredVariables) {
      if (requiredVar == "file") {
        if (file == null || file.isEmpty) {
          throw Exception("変数 'file' が指定されていません");
        }
      } else if (requiredVar.startsWith("input:")) {
        final varName = requiredVar.substring(6); // "input:"を除去
        if (variables == null || !variables.containsKey(varName)) {
          throw Exception("変数 '$varName' が指定されていません");
        }
      }
    }
  }
}
