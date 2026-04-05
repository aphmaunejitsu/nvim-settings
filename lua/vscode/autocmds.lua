-- IMEをノーマルモードのときは強制的にOFFにする
vim.api.nvim_create_autocmd('InsertLeave', {
  group = vim.api.nvim_create_augroup('vscode_ime_off', { clear = true }),
  callback = function()
    vim.fn.jobstart({ '/opt/homebrew/bin/im-select', 'com.apple.keylayout.ABC' }, { detach = true })
  end,
})

-- ヤンク時にハイライト
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('vscode_highlight_yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})
