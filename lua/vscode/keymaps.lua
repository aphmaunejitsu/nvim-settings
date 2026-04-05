local vscode = require('vscode')
local map = vim.keymap.set

-- コマンドパレット
map('n', '<leader>p', function() vscode.action('workbench.action.showCommands') end, { desc = 'コマンドパレット' })

-- ファイルエクスプローラー
map('n', '<leader>e', function() vscode.action('workbench.view.explorer') end, { desc = 'エクスプローラー' })

-- ファイル検索
map('n', '<leader>ff', function() vscode.action('workbench.action.quickOpen') end, { desc = 'ファイル検索' })

-- テキスト検索
map('n', '<leader>fg', function() vscode.action('workbench.action.findInFiles') end, { desc = 'テキスト検索' })

-- シンボル検索
map('n', '<leader>fs', function() vscode.action('workbench.action.gotoSymbol') end, { desc = 'シンボル検索' })

-- 定義へ移動
map('n', 'gd', function() vscode.action('editor.action.revealDefinition') end, { desc = '定義へ移動' })
map('n', 'gr', function() vscode.action('editor.action.goToReferences') end, { desc = '参照一覧' })
map('n', 'gi', function() vscode.action('editor.action.goToImplementation') end, { desc = '実装へ移動' })

-- コードアクション
map('n', '<leader>ca', function() vscode.action('editor.action.quickFix') end, { desc = 'コードアクション' })
map('n', '<leader>rn', function() vscode.action('editor.action.rename') end, { desc = 'リネーム' })

-- フォーマット
map('n', '<leader>lf', function() vscode.action('editor.action.formatDocument') end, { desc = 'フォーマット' })

-- 診断
map('n', '[d', function() vscode.action('editor.action.marker.prev') end, { desc = '前の診断' })
map('n', ']d', function() vscode.action('editor.action.marker.next') end, { desc = '次の診断' })

-- 折り畳み
map('n', 'za', function() vscode.action('editor.toggleFold') end, { desc = '折り畳みトグル' })
map('n', 'zR', function() vscode.action('editor.unfoldAll') end, { desc = '全展開' })
map('n', 'zM', function() vscode.action('editor.foldAll') end, { desc = '全折り畳み' })

-- ウィンドウ移動
map('n', '<C-h>', function() vscode.action('workbench.action.focusLeftGroup') end, { desc = '左グループへ' })
map('n', '<C-j>', function() vscode.action('workbench.action.focusBelowGroup') end, { desc = '下グループへ' })
map('n', '<C-k>', function() vscode.action('workbench.action.focusAboveGroup') end, { desc = '上グループへ' })
map('n', '<C-l>', function() vscode.action('workbench.action.focusRightGroup') end, { desc = '右グループへ' })

-- ビジュアルモードでインデント
map('v', '<', '<gv', { desc = 'インデント減' })
map('v', '>', '>gv', { desc = 'インデント増' })

-- 行移動
map('v', 'J', ":move '>+1<CR>gv=gv", { desc = '行を下に移動' })
map('v', 'K', ":move '<-2<CR>gv=gv", { desc = '行を上に移動' })
