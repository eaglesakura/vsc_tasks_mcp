// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_definition_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InputDefinitionDto _$InputDefinitionDtoFromJson(Map<String, dynamic> json) =>
    _InputDefinitionDto(
      id: json['id'] as String,
      description: json['description'] as String?,
      type: json['type'] as String?,
      options: json['options'] as List<dynamic>?,
    );

Map<String, dynamic> _$InputDefinitionDtoToJson(_InputDefinitionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'type': instance.type,
      'options': instance.options,
    };
