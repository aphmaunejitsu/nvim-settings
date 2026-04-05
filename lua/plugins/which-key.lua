return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      spec = {
        { '<leader>f', group = 'Find' },
        { '<leader>h', group = 'Git Hunk' },
        { '<leader>b', group = 'Buffer' },
        { '<leader>c', group = 'Code' },
        { '<leader>r', group = 'Rename' },
        { '<leader>g', group = 'Git' },
        { '<leader>m', group = 'Markdown' },
      },
    },
  },
}
