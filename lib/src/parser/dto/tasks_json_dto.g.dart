// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_json_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TasksJsonDto _$TasksJsonDtoFromJson(Map<String, dynamic> json) =>
    _TasksJsonDto(
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => TaskDefinitionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputs: (json['inputs'] as List<dynamic>?)
          ?.map((e) => InputDefinitionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TasksJsonDtoToJson(_TasksJsonDto instance) =>
    <String, dynamic>{'tasks': instance.tasks, 'inputs': instance.inputs};
