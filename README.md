# vsc_tasks_json

This package is an MCP server that enables AI agents to execute tasks defined in VSCode's `.vscode/tasks.json`.

## Overview

By adding the `options.mcp` property to task definitions in `tasks.json`, those tasks are registered as individual MCP tools. Each task can be called as an independent tool, and required variables are automatically defined as input schemas.

## Prerequisites

The following environment is required to use this MCP server:

- **tasks.json**: Tasks must be defined in `.vscode/tasks.json`

## Cursor MCP Configuration

### MCP Server Registration

Add the following to Cursor's configuration file (`.cursor/mcp.json`):

```json
{
  "mcpServers": {
    "vsc_tasks_json": {
      "command": "dart",
      "args": ["run", "vsc_tasks_json"],
      "env": {}
    }
  }
}
```

### Installation

#### Using `dart pub global activate`

To install globally:

```bash
dart pub global activate vsc_tasks_mcp
```

When installed using this method, the Cursor configuration file (`.cursor/mcp.json`) should be as follows:

```json
{
  "mcpServers": {
    "vsc_tasks_json": {
      "command": "vsc_tasks_mcp",
      "args": [],
      "env": {}
    }
  }
}
```

#### Adding to `pubspec.yaml`

To add as a project dependency, add the following to `pubspec.yaml`:

```yaml
dependencies:
  vsc_tasks_mcp: ^1.0.0
```

Then install the dependencies:

```bash
dart pub get
```

When installed using this method, the Cursor configuration file (`.cursor/mcp.json`) should be as follows:

```json
{
  "mcpServers": {
    "vsc_tasks_json": {
      "command": "dart",
      "args": ["run", "vsc_tasks_mcp"],
      "env": {}
    }
  }
}
```

### Project Root Detection

The MCP server detects the project root using the following method:

1. Check for the existence of `.vscode/tasks.json` from the current directory
2. If not found, search up to 10 parent directory levels
3. Use the found directory as the project root

### Starting the Server

You can start the MCP server from the project root with the following command:

```bash
dart run vsc_tasks_json
```

## tasks.json Configuration

This MCP server only registers tasks as individual tools if they have the `options.mcp` property set in their task definition in `tasks.json`.

### Configuration Example

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "build",
      "type": "shell",
      "command": "dart",
      "args": [
        "run",
        "grinder",
        "build",
        "--${input:platform}",
        "--release",
        "--flavor=${input:flavor}"
      ],
      "options": {
        "mcp": {
          "tool": "app_build",
          "description": "Execute Flutter app build"
        }
      }
    }
  ],
  "inputs": [
    {
      "id": "platform",
      "type": "pickString",
      "description": "Target platform for build",
      "options": ["android", "ios"]
    },
    {
      "id": "flavor",
      "type": "pickString",
      "description": "Build flavor",
      "options": ["development", "staging", "production"]
    }
  ]
}
```

With the above configuration, an MCP tool named `app_build` will be registered.

### options.mcp Configuration Fields

- `tool`: MCP tool name (required)
- `description`: Tool description (optional)

## Provided Tools

### Tool Input Schema

Required variables are automatically detected from the task's `command` and `args`, and an input schema is generated:

- `${input:platform}` → `platform` argument (required)
- `${input:flavor}` → `flavor` argument (required)
- `${file}` → `file` argument (required)

## Variable Support

The following variable formats are supported:

- `${input:variable_name}`: Variables defined in tasks.json inputs
- `${file}`: File path

## Logging

### Log File Locations

The MCP server outputs execution logs to the following locations:

- **Server log**: `build/vsc_tasks_mcp/mcp_server.log`
  - Records server startup, initialization, and errors
- **Tool logs**: `build/vsc_tasks_mcp/{tool_name}.log`
  - Creates individual log files for each tool execution
  - Records execution command, standard output, standard error output, and exit code

### Viewing Logs

#### Viewing Server Log

```bash
cat build/vsc_tasks_json/mcp_server.log
```

#### Viewing Tool Logs

```bash
# View app_build tool log
cat build/vsc_tasks_mcp/app_build.log
```

## Troubleshooting

### Task Not Found

**Symptom**: Task is not recognized as an MCP tool

**Causes and Solutions**:
- Verify that the `options.mcp` property is set
- Verify that the `options.mcp.tool` field exists

### Task Execution Error

**Symptom**: Error is returned when calling the tool

**Solutions**:
1. Get the log file path from the `logFile` field in the response
2. Check the log file for detailed error information
3. Check the `command` field for the actual command that was executed

```bash
# Example of checking log file
cat /path/to/project/build/vsc_tasks_mcp/app_build.log
```

### Project Root Not Detected

**Symptom**: Error indicating `.vscode/tasks.json` was not found

**Solutions**:
- Start the MCP server from the project root (or a subdirectory)
- Verify that `.vscode/tasks.json` exists
- Check the server log for the detected project root

```bash
cat build/vsc_tasks_mcp/mcp_server.log
```

### Variables Not Replaced

**Symptom**: `${input:xxx}` remains unchanged in the command

**Solutions**:
- Verify that all required arguments are passed when calling the tool
- Verify that argument names match the variable names in tasks.json (the `input:` prefix is not required)

