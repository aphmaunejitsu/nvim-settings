return {
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end
        map('n', ']h', gs.next_hunk, '次のhunk')
        map('n', '[h', gs.prev_hunk, '前のhunk')
        map('n', '<leader>hs', gs.stage_hunk, 'Hunkをステージ')
        map('n', '<leader>hr', gs.reset_hunk, 'Hunkをリセット')
        map('n', '<leader>hp', gs.preview_hunk, 'Hunkプレビュー')
        map('n', '<leader>hb', function() gs.blame_line({ full = true }) end, 'Blame表示')
      end,
    },
  },
}
