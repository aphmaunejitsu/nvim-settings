-- <leader> キーをスペースに設定
vim.g.mapleader = ' '
vim.o.number = true
vim.o.relativenumber = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.clipboard = 'unnamedplus'

require('plugins')


-- markdown-preview.nvim 設定とキーマップ
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_command_for_global = 1
vim.g.mkdp_open_to_the_world = 0
vim.g.mkdp_browser = ''
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_port = ''
vim.g.mkdp_page_title = '「${name}」プレビュー'

-- <leader>mp でMarkdownプレビュー
vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreview<CR>', { desc = 'Markdown Preview' })



vim.g['airline_powerline_fonts'] = 1
vim.g['airline_theme'] = 'shades_of_purple'
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#formatter'] = 'unique_tail'
vim.g['airline_section_z'] = '%3p%% %#__accent_bold#%l:%v%#__restore__#'

vim.keymap.set('n', '<Tab>', function()
  vim.cmd('Neotree toggle')
end, { noremap = true, silent = true, desc = 'Toggle Neo-tree' })


-- telescope.nvim 設定とキーマップ
if pcall(require, 'telescope') then
  require('telescope').setup{}
  -- ファイル検索: <leader>ff
  vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Telescope Find Files' })
  -- バッファ検索: <leader>fb
  vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Telescope Buffers' })
  -- live grep: <leader>fg
  vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Telescope Live Grep' })
end

vim.defer_fn(function()
  vim.cmd[[colorscheme shades_of_purple]]
end, 0)
