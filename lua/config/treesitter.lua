-- Treesitter (シンタックスハイライト) の設定
require('nvim-treesitter.configs').setup {
  -- 対応言語（自動インストール）
  ensure_installed = {
    "c", "lua", "vim", "vimdoc", "query",
    "javascript", "typescript", "python", "rust",
    "go", "java", "html", "css", "json", "yaml",
    "markdown", "markdown_inline", "bash"
  },

  -- すべての言語を自動でインストール（falseに設定して手動管理も可能）
  auto_install = true,

  -- シンタックスハイライト
  highlight = {
    enable = true,
    -- 特定のファイルタイプで無効化する場合
    -- disable = { "c", "rust" },
    -- 大きなファイルで無効化
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    -- vim のハイライトと併用
    additional_vim_regex_highlighting = false,
  },

  -- インデント
  indent = {
    enable = true,
    -- 特定の言語で無効化
    disable = { "python" },
  },

  -- 増分選択
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  -- テキストオブジェクト
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- カーソルより先の次のテキストオブジェクトを自動選択
      keymaps = {
        -- "af"で関数全体、"if"で関数内部を選択
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- ジャンプリストに追加
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
}
