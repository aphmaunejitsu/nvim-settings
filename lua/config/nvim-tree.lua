-- nvim-tree (ファイルエクスプローラー) の設定
require('nvim-tree').setup {
  sort_by = 'extension',
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_netrw = true,
  hijack_cursor = false,
  hijack_unnamed_buffer_when_opening = false,
  open_on_setup = false,
  open_on_setup_file = false,
  
  view = {
    width = '20%',
    side = 'left',
    signcolumn = 'no',
    number = false,
    relativenumber = false,
  },

  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = true,
    highlight_opened_files = 'name',
    root_folder_modifier = ':~',
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = 'before',
      padding = ' ',
      symlink_arrow = ' ➛ ',
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = '',
        symlink = '',
        git = {
          unstaged = '✗',
          staged = '✓',
          unmerged = '',
          renamed = '➜',
          untracked = '★',
          deleted = '',
          ignored = '◌',
        },
        folder = {
          arrow_open = '',
          arrow_closed = '',
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
        },
      },
    },
  },

  filters = {
    dotfiles = false,
    custom = { '.git', 'node_modules', '.cache' },
    exclude = {},
  },

  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = { '.git', 'target', 'build' },
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
        exclude = {
          filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
          buftype = { 'nofile', 'terminal', 'help' },
        },
      },
    },
  },

  trash = {
    cmd = 'gio trash',
    require_confirm = true,
  },

  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },

  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },

  on_attach = 'default'
}

-- カスタムコマンドの追加
vim.api.nvim_create_user_command('Ex', function() vim.cmd.NvimTreeToggle() end, {})
