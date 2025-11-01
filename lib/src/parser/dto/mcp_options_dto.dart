// ignore_for_file: invalid_annotation_target

import "package:freezed_annotation/freezed_annotation.dart";

part "mcp_options_dto.freezed.dart";
part "mcp_options_dto.g.dart";

/// options.mcpで定義されているMCPツール設定のDTO
@freezed
abstract class McpOptionsDto with _$McpOptionsDto {
  const factory McpOptionsDto({
    @JsonKey(name: "tool") required String tool,
    @JsonKey(name: "description") String? description,
  }) = _McpOptionsDto;
  const McpOptionsDto._();

  factory McpOptionsDto.fromJson(Map<String, dynamic> json) =>
      _$McpOptionsDtoFromJson(json);
}
