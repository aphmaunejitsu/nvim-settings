-- VSCode Neovim拡張用設定
vim.g.mapleader = ' '

local opt = vim.opt
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.clipboard = 'unnamedplus'
opt.ignorecase = true
opt.smartcase = true

require('vscode.keymaps')
require('vscode.autocmds')
