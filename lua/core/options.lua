vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt

-- 行番号
opt.number = true
opt.relativenumber = true

-- インデント
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- 検索
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- 表示
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = 'yes'
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

-- 分割
opt.splitbelow = true
opt.splitright = true

-- ファイル
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- クリップボード
opt.clipboard = 'unnamedplus'

-- 補完メニュー
opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- 更新時間
opt.updatetime = 250
opt.timeoutlen = 300

-- 診断アイコン
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.INFO] = ' ',
      [vim.diagnostic.severity.HINT] = '󰌵 ',
    },
  },
})
