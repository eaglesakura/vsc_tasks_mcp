// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mcp_options_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_McpOptionsDto _$McpOptionsDtoFromJson(Map<String, dynamic> json) =>
    _McpOptionsDto(
      tool: json['tool'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$McpOptionsDtoToJson(_McpOptionsDto instance) =>
    <String, dynamic>{
      'tool': instance.tool,
      'description': instance.description,
    };
