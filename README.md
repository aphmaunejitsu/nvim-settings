# Neovim Configuration

整理されたNeovim設定ファイルです。モジュラー構造で管理しやすくなっています。

## 📁 ファイル構造

```
~/.config/nvim/
├── init.lua                  # メイン設定ファイル（環境分岐あり）
├── lua/
│   ├── env.lua              # 環境検出モジュール
│   ├── base.lua             # 基本設定
│   ├── option.lua           # Neovimオプション設定
│   ├── keymaps.lua          # キーマップ設定（環境別分岐）
│   ├── plugins.lua          # プラグイン管理（ターミナル用）
│   ├── plugins-vscode.lua   # プラグイン管理（VSCode用）
│   ├── colorscheme.lua      # テーマ設定
│   └── config/              # プラグイン個別設定
│       ├── nvim-cmp.lua     # 補完設定
│       ├── lsp.lua          # LSP設定
│       ├── telescope.lua    # ファジーファインダー
│       ├── treesitter.lua   # シンタックスハイライト
│       ├── lualine.lua      # ステータスライン
│       ├── nvim-tree.lua    # ファイルエクスプローラー
│       ├── basic-plugins.lua # 基本プラグイン設定（ターミナル用）
│       └── basic-plugins-vscode.lua # 基本プラグイン設定（VSCode用）
└── option/                  # 旧設定（削除可能）
    ├── lualine.lua
    └── nvim-tree.lua
```

## 🔄 環境別設定

この設定は実行環境を自動検出し、適切な設定を読み込みます：

### ターミナル環境
- 全機能のNeovim設定
- UI プラグイン（lualine、nvim-tree、bufferlineなど）
- LSP、補完、ファジーファインダーなどの全機能

### VSCode環境  
- 最小限のプラグイン構成
- VSCodeの機能と重複しないよう調整
- VSCodeのコマンドと連携するキーマップ

### 環境確認コマンド
```vim
:EnvInfo
```

## 🔌 インストール済みプラグイン

### UI・テーマ
- **catppuccin**: 美しいカラーテーマ
- **lualine.nvim**: カスタマイズ可能なステータスライン
- **nvim-tree.lua**: ファイルエクスプローラー
- **bufferline.nvim**: バッファタブライン
- **indent-blankline.nvim**: インデントガイド

### 補完・LSP
- **nvim-lspconfig**: LSP設定
- **mason.nvim**: LSPサーバー管理
- **nvim-cmp**: 補完フレームワーク
- **copilot.vim**: GitHub Copilot統合
- **LuaSnip**: スニペットエンジン

### ユーティリティ
- **telescope.nvim**: ファジーファインダー
- **nvim-treesitter**: 高度なシンタックスハイライト
- **gitsigns.nvim**: Git統合
- **nvim-autopairs**: 括弧自動補完
- **Comment.nvim**: コメントトグル

### 開発支援
- **ale**: リンター・フォーマッター
- **glow.nvim**: Markdownプレビュー
- **vim-fugitive**: Git操作

## ⌨️ 主要なキーマップ

### 基本操作（全環境共通）
- `<Space>`: リーダーキー
- `jj`: Escapeキー（Insert mode）
- `<leader>h`: 検索ハイライトクリア
- `<C-h/j/k/l>`: ウィンドウ移動

### ターミナル環境専用
#### ウィンドウ・バッファ操作
- `<S-h/l>`: バッファ切り替え
- `<C-Up/Down/Left/Right>`: ウィンドウサイズ調整

#### ファイル・プロジェクト管理
- `<C-i>`: NvimTreeトグル
- `<leader>e`: NvimTreeフォーカス
- `<leader>ff`: ファイル検索（Telescope）
- `<leader>fg`: テキスト検索（Telescope）
- `<leader>fb`: バッファ検索（Telescope）
- `<leader>fr`: 最近のファイル

#### Git関連
- `<leader>gg`: Git status
- `<leader>gd`: Git diff
- `<leader>gb`: Git blame

### VSCode環境専用  
#### ファイル・プロジェクト管理
- `<leader>p`: コマンドパレット
- `<leader>ff`: クイックオープン
- `<leader>fg`: ファイル内検索
- `<leader>fb`: 全エディタ表示
- `<C-i>`: エクスプローラーフォーカス
- `<leader>e`: エクスプローラートグル

#### バッファ・タブ操作
- `<S-h/l>`: エディタ切り替え

#### Git関連
- `<leader>gg`: ソース管理
- `<leader>gd`: 変更を開く

### LSP機能（環境別に実装が異なる）
- `gd`: 定義にジャンプ
- `K`: ホバー情報表示
- `gr`: 参照検索
- `<leader>rn`: リネーム
- `<leader>ca`: コードアクション
- `<leader>f`: フォーマット

### Copilot（全環境共通）
- `<C-g>`: Copilot候補受け入れ（Insert mode）
- `<M-]>/<M-[>`: 次/前のCopilot候補（ターミナルのみ）
- `<leader>cp`: Copilotパネル（ターミナルのみ）

## 🚀 セットアップ手順

### ターミナル環境
1. Neovimを起動
2. `:PackerSync` でプラグインをインストール
3. `:Mason` でLSPサーバーを管理（自動インストール済み）
4. 再起動

### VSCode環境
1. VSCode Neovim拡張機能をインストール
2. Neovimを起動（VSCode内）
3. `:PackerSync` で最小限のプラグインをインストール
4. VSCodeを再起動

### 環境確認
```vim
:EnvInfo
```
現在の実行環境を確認できます。

## 🔧 カスタマイズ

### 新しいプラグインを追加
`lua/plugins.lua` にプラグインを追加し、`:PackerSync` を実行

### LSPサーバーを追加
`lua/config/lsp.lua` の `servers` テーブルに設定を追加

### キーマップを変更
`lua/keymaps.lua` で変更

### テーマを変更
`lua/colorscheme.lua` で変更

## 📝 注意事項

- 旧設定ファイル（`option/`フォルダ）は削除可能
- Mason経由で自動的にLSPサーバーがインストールされます
- Copilotは別途GitHubアカウントでの認証が必要です（`:Copilot setup`）

## 🐛 トラブルシューティング

### プラグインエラー
```vim
:PackerClean
:PackerSync
```

### LSPが動かない
```vim
:Mason
:LspInfo
```

### 設定の再読み込み
```vim
:source %
```
