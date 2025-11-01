// ignore_for_file: invalid_annotation_target

import "package:freezed_annotation/freezed_annotation.dart";

part "task_definition_dto.freezed.dart";
part "task_definition_dto.g.dart";

/// tasks.jsonで定義されているタスクの定義のDTO
@freezed
abstract class TaskDefinitionDto with _$TaskDefinitionDto {
  const factory TaskDefinitionDto({
    @JsonKey(name: "label") required String label,
    @JsonKey(name: "command") required String command,
    @JsonKey(name: "args") List<String>? args,
    @JsonKey(name: "options") Map<String, dynamic>? options,
  }) = _TaskDefinitionDto;
  factory TaskDefinitionDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDefinitionDtoFromJson(json);

  const TaskDefinitionDto._();
}
