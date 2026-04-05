return {
  {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'ファイル検索' },
      { '<leader>fg', '<cmd>Telescope live_grep<CR>', desc = 'テキスト検索' },
      { '<leader>fb', '<cmd>Telescope buffers<CR>', desc = 'バッファ一覧' },
      { '<leader>fh', '<cmd>Telescope help_tags<CR>', desc = 'ヘルプ検索' },
      { '<leader>fr', '<cmd>Telescope oldfiles<CR>', desc = '最近のファイル' },
      { '<leader>fd', '<cmd>Telescope diagnostics<CR>', desc = '診断一覧' },
      { '<leader>fs', '<cmd>Telescope lsp_document_symbols<CR>', desc = 'シンボル検索' },
    },
    config = function()
      local telescope = require('telescope')
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ['<C-j>'] = 'move_selection_next',
              ['<C-k>'] = 'move_selection_previous',
            },
          },
        },
      })
      pcall(telescope.load_extension, 'fzf')
    end,
  },
}
