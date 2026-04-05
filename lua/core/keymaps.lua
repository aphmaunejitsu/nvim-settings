local map = vim.keymap.set

-- ハイライト解除
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'ハイライト解除' })

-- ウィンドウ移動
map('n', '<C-h>', '<C-w>h', { desc = '左ウィンドウへ' })
map('n', '<C-j>', '<C-w>j', { desc = '下ウィンドウへ' })
map('n', '<C-k>', '<C-w>k', { desc = '上ウィンドウへ' })
map('n', '<C-l>', '<C-w>l', { desc = '右ウィンドウへ' })

-- ウィンドウリサイズ
map('n', '<C-Up>', '<cmd>resize +2<CR>', { desc = 'ウィンドウ縦拡大' })
map('n', '<C-Down>', '<cmd>resize -2<CR>', { desc = 'ウィンドウ縦縮小' })
map('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'ウィンドウ横縮小' })
map('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'ウィンドウ横拡大' })

-- バッファ移動
map('n', '<S-h>', '<cmd>bprevious<CR>', { desc = '前のバッファ' })
map('n', '<S-l>', '<cmd>bnext<CR>', { desc = '次のバッファ' })
map('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'バッファ削除' })

-- ビジュアルモードでインデント
map('v', '<', '<gv', { desc = 'インデント減' })
map('v', '>', '>gv', { desc = 'インデント増' })

-- 行移動
map('v', 'J', ":move '>+1<CR>gv=gv", { desc = '行を下に移動' })
map('v', 'K', ":move '<-2<CR>gv=gv", { desc = '行を上に移動' })

-- ペースト時にレジスタを保持
map('x', '<leader>p', [["_dP]], { desc = 'レジスタ保持ペースト' })
