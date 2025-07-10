-- 表示設定
vim.opt.number = true              -- 行番号表示
vim.opt.cursorline = true          -- カーソル行をハイライト
vim.opt.splitright = true          -- 縦分割時は右側に開く
vim.opt.signcolumn = "yes"         -- サインカラムを常に表示

-- エンコーディング
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8"

-- ファイル処理
vim.opt.swapfile = false           -- スワップファイルを作成しない
vim.opt.backup = false             -- バックアップファイルを作成しない
vim.opt.writebackup = false        -- 書き込み前のバックアップを作成しない

-- 検索設定
vim.opt.hlsearch = true            -- 検索結果をハイライト
vim.opt.incsearch = true           -- インクリメンタル検索
vim.opt.ignorecase = true          -- 大文字小文字を区別しない
vim.opt.smartcase = true           -- 大文字が含まれている場合は区別する

-- インデント設定
vim.opt.tabstop = 4                -- タブ文字の表示幅
vim.opt.shiftwidth = 4             -- 自動インデントの幅
vim.opt.expandtab = true           -- タブをスペースに変換
vim.opt.smartindent = true         -- スマートインデント
vim.opt.autoindent = true          -- 自動インデント

-- 折り畳み設定
vim.opt.foldenable = false         -- 折り畳みを無効

-- その他
vim.opt.modelines = 0              -- モードラインを無効
vim.opt.mouse = "a"                -- マウス操作を有効
vim.opt.clipboard = "unnamedplus"  -- システムクリップボードを使用
vim.opt.updatetime = 300           -- CursorHoldイベントの待機時間を短縮
vim.opt.timeoutlen = 500           -- キーマップのタイムアウト時間
