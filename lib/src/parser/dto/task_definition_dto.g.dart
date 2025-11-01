// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_definition_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskDefinitionDto _$TaskDefinitionDtoFromJson(Map<String, dynamic> json) =>
    _TaskDefinitionDto(
      label: json['label'] as String,
      command: json['command'] as String,
      args: (json['args'] as List<dynamic>?)?.map((e) => e as String).toList(),
      options: json['options'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$TaskDefinitionDtoToJson(_TaskDefinitionDto instance) =>
    <String, dynamic>{
      'label': instance.label,
      'command': instance.command,
      'args': instance.args,
      'options': instance.options,
    };
