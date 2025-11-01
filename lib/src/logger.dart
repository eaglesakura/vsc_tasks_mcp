import "dart:io";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:path/path.dart" as p;

/// MCPサーバー用のロガー
@internal
class Logger {
  /// ログファイル
  late final File file;

  Logger({
    required String packageName,
    required Directory projectRoot,
    required String name,
    bool clearLogFile = true,
  }) {
    final buildDir = Directory(
      p.join(projectRoot.path, "build", packageName),
    );
    if (!buildDir.existsSync()) {
      buildDir.createSync(recursive: true);
    }
    final logFilePath = p.join(buildDir.path, "$name.log");
    file = File(logFilePath).absolute;
    if (clearLogFile && file.existsSync()) {
      file.deleteSync();
    }
    file.createSync(recursive: true);
  }

  /// エラーログを出力する
  void error(String message, {StackTrace? stackTrace}) {
    _writeLog(_LogLevel.error, message);
    if (stackTrace != null) {
      _appendToFile("${stackTrace.toString()}\n");
    }
  }

  /// 情報ログを出力する
  void info(String message) {
    _writeLog(_LogLevel.info, message);
  }

  /// 警告ログを出力する
  void warn(String message) {
    _writeLog(_LogLevel.warn, message);
  }

  /// タイムスタンプなしで生のテキストを書き込む（リアルタイム出力用）
  void writeRaw(String message) {
    _appendToFile(message);
  }

  /// ファイルに文字列を追記する
  void _appendToFile(String content) {
    try {
      file.writeAsStringSync(
        content,
        mode: FileMode.append,
        flush: true,
      );
    } on Exception catch (e) {
      // ファイル書き込みエラーは無視（ログ出力のため、エラーをログに書くと無限ループになる）
      stderr.writeln("Failed to write to log file: $e");
    }
  }

  /// タイムスタンプ付きのログを出力する
  void _writeLog(_LogLevel level, String message) {
    final timestamp = DateTime.now().toIso8601String();
    final levelStr = level.name.toUpperCase();
    final logLine = "[$timestamp] $levelStr: $message\n";

    // ファイルに書き込み
    _appendToFile(logLine);

    // stderrにも出力
    stderr.writeln("[$levelStr] [${p.basename(file.path)}] $logLine");
  }
}

/// ログレベル
enum _LogLevel {
  /// 情報
  info,

  /// 警告
  warn,

  /// エラー
  error,
}
