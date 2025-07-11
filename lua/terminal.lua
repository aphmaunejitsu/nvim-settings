-- ターミナルNeovim時の設定
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.clipboard = 'unnamedplus'

-- プラグイン管理
require('plugins')



-- vim-airline ベストプラクティス設定
vim.g['airline_powerline_fonts'] = 1
vim.g['airline_theme'] = 'shades_of_purple'
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#formatter'] = 'unique_tail'
vim.g['airline_section_z'] = '%3p%% %#__accent_bold#%l:%v%#__restore__#'

vim.defer_fn(function()
  vim.cmd[[colorscheme shades_of_purple]]
end, 0)
