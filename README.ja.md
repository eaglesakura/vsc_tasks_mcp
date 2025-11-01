# vsc_tasks_json

本パッケージは、VSCodeの`.vscode/tasks.json`に定義されているタスクをAI Agentから実行可能にするMCPサーバーである。

## 概要

[dart_mcp](https://pub.dev/packages/dart_mcp)パッケージを使用して実装されたMCPサーバーである。

`tasks.json`のタスク定義に`options.mcp`プロパティを追加することで、そのタスクが個別のMCPツールとして登録される。各タスクは独立したツールとして呼び出すことができ、必要な変数は入力スキーマとして自動的に定義される。

## 前提条件

本MCPサーバーの使用には以下の環境が必要である：

- **tasks.json**: `.vscode/tasks.json`でタスク定義を行っていること

## Cursor MCP設定

### MCPサーバーの登録

Cursorの設定ファイル（`~/.cursor/mcp.json`）に以下を追加する：

```json
{
  "mcpServers": {
    "vsc_tasks_json": {
      "command": "dart",
      "args": ["run", "vsc_tasks_json:mcp"],
      "env": {}
    }
  }
}
```

### プロジェクトルートの検出

MCPサーバーは以下の方法でプロジェクトルートを検出する：

1. カレントディレクトリから`.vscode/tasks.json`の存在を確認
2. 見つからない場合は親ディレクトリを最大10階層まで探索
3. 見つかったディレクトリをプロジェクトルートとして使用

### 起動方法

プロジェクトルートから以下のコマンドでMCPサーバーを起動できる：

```bash
dart run vsc_tasks_json:mcp
```

## tasks.jsonの設定

本MCPサーバーは、`tasks.json`のタスク定義に`options.mcp`プロパティが設定されているタスクのみを個別のツールとして登録する。

### 設定例

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
          "description": "Flutterアプリビルドを実行する"
        }
      }
    }
  ],
  "inputs": [
    {
      "id": "platform",
      "type": "pickString",
      "description": "ビルド対象のプラットフォーム",
      "options": ["android", "ios"]
    },
    {
      "id": "flavor",
      "type": "pickString",
      "description": "ビルドフレーバー",
      "options": ["development", "staging", "production"]
    }
  ]
}
```

上記の設定により、`app_build`という名前のMCPツールが登録される。

### options.mcpの設定項目

- `tool`: MCPツール名（必須）
- `description`: ツールの説明（省略可）

## 提供するツール

### ツールの入力スキーマ

タスクの`command`と`args`から必要な変数を自動検出し、入力スキーマを生成する：

- `${input:platform}` → `platform`引数（必須）
- `${input:flavor}` → `flavor`引数（必須）
- `${file}` → `file`引数（必須）

## 変数のサポート

以下の変数形式をサポートする：

- `${input:変数名}`: tasks.jsonのinputsで定義された変数
- `${file}`: ファイルパス

## ログ機能

### ログファイルの場所

MCPサーバーは実行ログを以下の場所に出力する：

- **サーバーログ**: `build/vsc_tasks_json/mcp_server.log`
  - サーバーの起動、初期化、エラーを記録
- **ツールログ**: `build/vsc_tasks_json/{tool_name}.log`
  - 各ツールの実行ごとに個別のログファイルを作成
  - 実行コマンド、標準出力、標準エラー出力、終了コードを記録

### ログの確認方法

#### サーバーログの確認

```bash
cat build/vsc_tasks_json/mcp_server.log
```

#### ツールログの確認

```bash
# app_buildツールのログを確認
cat build/vsc_tasks_json/app_build.log
```

## トラブルシューティング

### タスクが見つからない

**症状**: MCPツールとして認識されない

**原因と対処法**:
- `options.mcp`プロパティが設定されているか確認する
- `options.mcp.tool`フィールドが存在するか確認する

### タスク実行がエラーになる

**症状**: ツール呼び出し時にエラーが返される

**対処法**:
1. レスポンスの`logFile`フィールドからログファイルのパスを取得
2. ログファイルを確認して詳細なエラー情報を確認
3. `command`フィールドで実際に実行されたコマンドを確認

```bash
# ログファイルの確認例
cat /path/to/project/build/vsc_tasks_json/app_build.log
```

### プロジェクトルートが検出されない

**症状**: `.vscode/tasks.json`が見つからないエラー

**対処法**:
- MCPサーバーをプロジェクトルート（またはその配下）から起動する
- `.vscode/tasks.json`が存在することを確認する
- サーバーログで検出されたプロジェクトルートを確認する

```bash
cat build/vsc_tasks_json/mcp_server.log
```

### 変数が置換されない

**症状**: `${input:xxx}`がそのままコマンドに残る

**対処法**:
- ツール呼び出し時に必要な引数が全て渡されているか確認
- 引数名がtasks.jsonの変数名と一致しているか確認（`input:`プレフィックスは不要）
