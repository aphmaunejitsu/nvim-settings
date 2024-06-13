-- 行番号
vim.opt.number = true
-- モードライン
vim.opt.modelines = 0
-- エンコーディング
vim.opt.encoding = "utf-8"
-- ファイルエンコーディング
vim.opt.fileencodings = "utf-8"
-- スワップ作らない
vim.opt.swapfile = false
-- 行番号ハイライト
vim.opt.cursorline = true
-- 検索結果のハイライト
vim.opt.hlsearch = true
-- 折り畳みしない
vim.opt.foldenable = false
-- 右側に開く
vim.opt.splitright = true

-- タブとインデント
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- automated settings
local function open_nvim_tree()
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
-- vim.opt.laststatus = 3
