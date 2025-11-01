/// options.mcpで定義されているMCPツール設定
class McpOptions {
  /// MCPツール名
  final String tool;

  /// MCPツールの説明
  final String? description;

  const McpOptions({
    required this.tool,
    this.description,
  });
}
