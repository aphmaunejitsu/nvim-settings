-- 環境検出
local env = require("env")

-- リーダーキーの設定
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ===============================================
-- 基本的なキーマップ（全環境共通）
-- ===============================================

-- Escapeキーの代替
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Exit insert mode with jj' })

-- 検索ハイライトを消去
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { desc = 'Clear search highlights' })

-- より良いウィンドウナビゲーション
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- テキスト移動（Visual mode）
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- ===============================================
-- 環境別キーマップ
-- ===============================================

if env.vscode() then
  -- ===============================================
  -- VSCode環境専用キーマップ
  -- ===============================================
  
  -- VSCode コマンドパレット
  vim.keymap.set('n', '<leader>p', '<Cmd>call VSCodeNotify("workbench.action.showCommands")<CR>', { desc = 'Command Palette' })
  
  -- ファイル関連
  vim.keymap.set('n', '<leader>ff', '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>', { desc = 'Quick Open' })
  vim.keymap.set('n', '<leader>fg', '<Cmd>call VSCodeNotify("workbench.action.findInFiles")<CR>', { desc = 'Search in Files' })
  vim.keymap.set('n', '<leader>fb', '<Cmd>call VSCodeNotify("workbench.action.showAllEditors")<CR>', { desc = 'Show All Editors' })
  
  -- エクスプローラー
  vim.keymap.set('n', '<C-i>', '<Cmd>call VSCodeNotify("workbench.files.action.focusFilesExplorer")<CR>', { desc = 'Focus Explorer' })
  vim.keymap.set('n', '<leader>e', '<Cmd>call VSCodeNotify("workbench.view.explorer")<CR>', { desc = 'Toggle Explorer' })
  
  -- LSP風機能（VSCodeの機能を呼び出し）
  vim.keymap.set('n', 'gd', '<Cmd>call VSCodeNotify("editor.action.revealDefinition")<CR>', { desc = 'Go to Definition' })
  vim.keymap.set('n', 'gr', '<Cmd>call VSCodeNotify("editor.action.goToReferences")<CR>', { desc = 'Go to References' })
  vim.keymap.set('n', 'K', '<Cmd>call VSCodeNotify("editor.action.showHover")<CR>', { desc = 'Show Hover' })
  vim.keymap.set('n', '<leader>rn', '<Cmd>call VSCodeNotify("editor.action.rename")<CR>', { desc = 'Rename Symbol' })
  vim.keymap.set('n', '<leader>ca', '<Cmd>call VSCodeNotify("editor.action.quickFix")<CR>', { desc = 'Quick Fix' })
  vim.keymap.set('n', '<leader>f', '<Cmd>call VSCodeNotify("editor.action.formatDocument")<CR>', { desc = 'Format Document' })
  
  -- バッファ/タブ操作
  vim.keymap.set('n', '<S-h>', '<Cmd>call VSCodeNotify("workbench.action.previousEditor")<CR>', { desc = 'Previous Editor' })
  vim.keymap.set('n', '<S-l>', '<Cmd>call VSCodeNotify("workbench.action.nextEditor")<CR>', { desc = 'Next Editor' })
  
  -- Git関連
  vim.keymap.set('n', '<leader>gg', '<Cmd>call VSCodeNotify("workbench.view.scm")<CR>', { desc = 'Source Control' })
  vim.keymap.set('n', '<leader>gd', '<Cmd>call VSCodeNotify("git.openChange")<CR>', { desc = 'Open Changes' })
  
  -- Copilot設定（VSCode環境でも使用可能）
  vim.g.copilot_no_tab_map = true
  vim.g.copilot_assume_mapped = true

elseif env.terminal() then
  -- ===============================================
  -- ターミナル環境専用キーマップ
  -- ===============================================
  
  -- ウィンドウサイズ調整
  vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
  vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
  vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
  vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

  -- バッファナビゲーション
  vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })
  vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { desc = 'Previous buffer' })

  -- NvimTree
  vim.keymap.set('n', '<C-i>', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
  vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>', { desc = 'Focus NvimTree' })

  -- Telescope（ファジーファインダー）
  vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
  vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Live grep' })
  vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Find buffers' })
  vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Help tags' })
  vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Recent files' })

  -- Copilot設定
  vim.g.copilot_no_tab_map = true
  vim.g.copilot_assume_mapped = true

  -- Copilot手動トリガー
  vim.keymap.set('i', '<C-g>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
    desc = 'Accept Copilot suggestion'
  })

  -- 次/前のCopilot候補
  vim.keymap.set('i', '<M-]>', '<Plug>(copilot-next)', { desc = 'Next Copilot suggestion' })
  vim.keymap.set('i', '<M-[>', '<Plug>(copilot-previous)', { desc = 'Previous Copilot suggestion' })

  -- Copilotパネル
  vim.keymap.set('n', '<leader>cp', ':Copilot panel<CR>', { desc = 'Open Copilot panel' })

  -- Git関連（ターミナル環境）
  vim.keymap.set('n', '<leader>gg', ':Git<CR>', { desc = 'Git status' })
  vim.keymap.set('n', '<leader>gd', ':Gitsigns diffthis<CR>', { desc = 'Git diff' })
  vim.keymap.set('n', '<leader>gb', ':Gitsigns blame_line<CR>', { desc = 'Git blame' })

end

-- ===============================================
-- 共通のユーティリティコマンド
-- ===============================================

-- 環境情報表示コマンド
vim.api.nvim_create_user_command('EnvInfo', function()
  env.print_env()
end, {})
