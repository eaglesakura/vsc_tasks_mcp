import "package:meta/meta.dart";

/// tasks.jsonで定義されているinputの定義
@internal
class InputDefinition {
  /// inputのID
  final String id;

  /// inputの説明
  final String description;

  /// inputのタイプ
  final String type;

  /// 選択可能なオプション（pickStringの場合）
  final List<String> options;

  const InputDefinition({
    required this.id,
    required this.description,
    required this.type,
    required this.options,
  });
}
