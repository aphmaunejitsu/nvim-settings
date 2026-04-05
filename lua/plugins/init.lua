-- lazy.nvim ブートストラップ
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = {
    { import = 'plugins.colorscheme' },
    { import = 'plugins.treesitter' },
    { import = 'plugins.telescope' },
    { import = 'plugins.neo-tree' },
    { import = 'plugins.lualine' },
    { import = 'plugins.gitsigns' },
    { import = 'plugins.which-key' },
    { import = 'plugins.autopairs' },
    { import = 'plugins.comment' },
    { import = 'plugins.indent-blankline' },
    { import = 'plugins.markdown-preview' },
  },
  install = { colorscheme = { 'tokyonight' } },
  checker = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})
