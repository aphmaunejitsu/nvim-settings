require("catppuccin").setup {
    background = {
		light = "latte",
		dark = "frappe",
	},
	transparent_background = true,
}

-- 背景の透明を維持する
-- vim.api.nvim_exec([[
-- augroup TransparentBG
--   autocmd!
--   autocmd Colorscheme * highlight Normal ctermbg=none
--   autocmd Colorscheme * highlight NonText ctermbg=none
--   autocmd Colorscheme * highlight LineNr ctermbg=none
--   autocmd Colorscheme * highlight Folded ctermbg=none
--   autocmd Colorscheme * highlight EndOfBuffer ctermbg=none
-- augroup END
-- ]], false)

-- colorscheme
vim.cmd([[colorscheme catppuccin]])
