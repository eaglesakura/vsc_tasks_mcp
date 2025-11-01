// ignore_for_file: invalid_annotation_target

import "package:freezed_annotation/freezed_annotation.dart";

part "input_definition_dto.freezed.dart";
part "input_definition_dto.g.dart";

/// tasks.jsonで定義されているinputの定義のDTO
@freezed
abstract class InputDefinitionDto with _$InputDefinitionDto {
  const factory InputDefinitionDto({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "options") List<dynamic>? options,
  }) = _InputDefinitionDto;
  factory InputDefinitionDto.fromJson(Map<String, dynamic> json) =>
      _$InputDefinitionDtoFromJson(json);

  const InputDefinitionDto._();
}
