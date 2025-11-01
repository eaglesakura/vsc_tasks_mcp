// ignore_for_file: invalid_annotation_target

import "package:freezed_annotation/freezed_annotation.dart";
import "package:vsc_tasks_json/src/parser/dto/input_definition_dto.dart";
import "package:vsc_tasks_json/src/parser/dto/task_definition_dto.dart";

part "tasks_json_dto.freezed.dart";
part "tasks_json_dto.g.dart";

/// tasks.jsonのルート構造を表すDTO
@freezed
abstract class TasksJsonDto with _$TasksJsonDto {
  const factory TasksJsonDto({
    @JsonKey(name: "tasks") List<TaskDefinitionDto>? tasks,
    @JsonKey(name: "inputs") List<InputDefinitionDto>? inputs,
  }) = _TasksJsonDto;

  factory TasksJsonDto.fromJson(Map<String, dynamic> json) =>
      _$TasksJsonDtoFromJson(json);
}
