if vim.g.vscode then
  require('vscode_config')
else
  require('core.options')
  require('core.keymaps')
  require('core.autocmds')
  require('plugins')
end
