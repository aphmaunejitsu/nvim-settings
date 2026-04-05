return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      -- パーサーの自動インストール
      local ensure = {
        'lua', 'vim', 'vimdoc', 'query',
        'javascript', 'typescript', 'tsx',
        'html', 'css', 'json', 'yaml',
        'python', 'bash', 'markdown', 'markdown_inline',
      }
      for _, lang in ipairs(ensure) do
        pcall(function()
          vim.treesitter.language.add(lang)
        end)
      end

      -- ハイライト・インデントはNeovim組み込みを使用
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter_start', { clear = true }),
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
