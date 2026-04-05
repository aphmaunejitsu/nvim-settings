# Neovim Configuration

Leader キー: `Space`

## ディレクトリ構成

```
~/.config/nvim/
├── init.lua                      # エントリポイント (VSCode/ターミナル分岐)
└── lua/
    ├── core/                     # ターミナル Neovim 共通設定
    │   ├── options.lua
    │   ├── keymaps.lua
    │   └── autocmds.lua
    ├── plugins/                  # lazy.nvim プラグイン定義
    │   ├── init.lua
    │   ├── colorscheme.lua       # tokyonight
    │   ├── treesitter.lua
    │   ├── telescope.lua
    │   ├── neo-tree.lua
    │   ├── lualine.lua
    │   ├── gitsigns.lua
    │   ├── which-key.lua
    │   ├── autopairs.lua
    │   ├── comment.lua
    │   ├── indent-blankline.lua
    │   └── markdown-preview.lua
    └── vscode/                   # VSCode Neovim 拡張用設定
        ├── init.lua
        ├── keymaps.lua
        └── autocmds.lua
```

---

## ターミナル Neovim キーマップ

### 基本操作

| キー | モード | 説明 |
|------|--------|------|
| `<Esc>` | n | 検索ハイライト解除 |
| `gcc` | n | 行コメントトグル (Comment.nvim) |
| `gc` | v | 選択範囲コメントトグル |

### ウィンドウ操作

| キー | モード | 説明 |
|------|--------|------|
| `<C-h>` | n | 左ウィンドウへ移動 |
| `<C-j>` | n | 下ウィンドウへ移動 |
| `<C-k>` | n | 上ウィンドウへ移動 |
| `<C-l>` | n | 右ウィンドウへ移動 |
| `<C-Up>` | n | ウィンドウ縦拡大 |
| `<C-Down>` | n | ウィンドウ縦縮小 |
| `<C-Left>` | n | ウィンドウ横縮小 |
| `<C-Right>` | n | ウィンドウ横拡大 |

### バッファ操作

| キー | モード | 説明 |
|------|--------|------|
| `<S-h>` | n | 前のバッファ |
| `<S-l>` | n | 次のバッファ |
| `<leader>bd` | n | バッファ削除 |

### 編集

| キー | モード | 説明 |
|------|--------|------|
| `<` / `>` | v | インデント増減 (選択維持) |
| `J` / `K` | v | 行を上下に移動 |
| `<leader>p` | x | レジスタ保持ペースト |

### Telescope (検索)

| キー | モード | 説明 |
|------|--------|------|
| `<leader>ff` | n | ファイル検索 |
| `<leader>fg` | n | テキスト検索 (live grep) |
| `<leader>fb` | n | バッファ一覧 |
| `<leader>fh` | n | ヘルプ検索 |
| `<leader>fr` | n | 最近のファイル |
| `<leader>fd` | n | 診断一覧 |
| `<leader>fs` | n | シンボル検索 |

Telescope 内: `<C-j>` / `<C-k>` で選択移動

### Neo-tree (ファイルツリー)

| キー | モード | 説明 |
|------|--------|------|
| `<Tab>` | n | ファイルツリー トグル |
| `<leader>ge` | n | Git ステータス表示 |

### Gitsigns (Git 差分)

| キー | モード | 説明 |
|------|--------|------|
| `]h` / `[h` | n | 次/前の hunk へ移動 |
| `<leader>hs` | n | hunk をステージ |
| `<leader>hr` | n | hunk をリセット |
| `<leader>hp` | n | hunk プレビュー |
| `<leader>hb` | n | blame 表示 |

### Markdown

| キー | モード | 説明 |
|------|--------|------|
| `<leader>mp` | n | Markdown プレビュー |

---

## VSCode Neovim キーマップ

VSCode Neovim 拡張使用時に有効。ターミナルと同じキーで VSCode の機能を呼び出す。

### ナビゲーション

| キー | モード | 説明 |
|------|--------|------|
| `<leader>p` | n | コマンドパレット |
| `<leader>e` | n | エクスプローラー |
| `<leader>ff` | n | ファイル検索 (Quick Open) |
| `<leader>fg` | n | テキスト検索 (Find in Files) |
| `<leader>fs` | n | シンボル検索 |

### コード操作

| キー | モード | 説明 |
|------|--------|------|
| `gd` | n | 定義へ移動 |
| `gr` | n | 参照一覧 |
| `gi` | n | 実装へ移動 |
| `<leader>ca` | n | コードアクション |
| `<leader>rn` | n | リネーム |
| `<leader>lf` | n | フォーマット |
| `[d` / `]d` | n | 前/次の診断 |

### 折り畳み

| キー | モード | 説明 |
|------|--------|------|
| `za` | n | 折り畳みトグル |
| `zR` | n | 全展開 |
| `zM` | n | 全折り畳み |

### ウィンドウ / 編集

ターミナル版と共通: `<C-h/j/k/l>` (グループ移動), `< >` (インデント), `J K` (行移動)

### 自動動作

- **InsertLeave**: IME を自動的に英数に切替 (`im-select`)
- **TextYankPost**: ヤンク箇所をハイライト

---

## 自動動作 (ターミナル)

| イベント | 説明 |
|----------|------|
| TextYankPost | ヤンク箇所を 200ms ハイライト |
| BufReadPost | 最後のカーソル位置を復元 |
| TermOpen | ターミナルバッファの行番号を非表示 |
| BufWritePre | 保存時に末尾空白を削除 |

---

## プラグイン一覧

| プラグイン | 説明 |
|-----------|------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | プラグインマネージャ |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | カラースキーム |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | シンタックスハイライト |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | ファジーファインダー |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | ファイルエクスプローラー |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | ステータスライン |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git 差分・blame |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | キーマップガイド |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | 自動括弧閉じ |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | コメントトグル |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | インデントガイド |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | Markdown プレビュー |
