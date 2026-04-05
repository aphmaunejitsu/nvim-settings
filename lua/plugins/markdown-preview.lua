return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function() vim.fn['mkdp#util#install']() end,
    keys = {
      { '<leader>mp', '<cmd>MarkdownPreview<CR>', desc = 'Markdownプレビュー' },
    },
    init = function()
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_page_title = '「${name}」プレビュー'
    end,
  },
}
