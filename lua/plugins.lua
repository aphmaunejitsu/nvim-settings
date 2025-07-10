local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer自体を管理
  use 'wbthomason/packer.nvim'

  -- ===============================================
  -- テーマ・UI関連
  -- ===============================================
  use { "catppuccin/nvim", as = "catppuccin" }
  
  use { 
    'nvim-lualine/lualine.nvim',
    config = function()
        require 'config/lualine'
    end,
    requires = {'nvim-tree/nvim-web-devicons', opt = true},
  }

  use {
    'nvim-tree/nvim-tree.lua',
    config = function() 
        require 'config/nvim-tree' 
    end,
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }

  -- バッファライン
  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons'
  }

  -- ===============================================
  -- 補完・LSP関連
  -- ===============================================
  -- LSP設定
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- 補完フレームワーク
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- スニペット
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- GitHub Copilot
  use 'github/copilot.vim'
  use 'zbirenbaum/copilot-cmp'

  -- ===============================================
  -- ユーティリティ
  -- ===============================================
  -- ファジーファインダー
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Git統合
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'

  -- シンタックスハイライト
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- ペアの自動補完
  use 'windwp/nvim-autopairs'

  -- コメントトグル
  use 'numToStr/Comment.nvim'

  -- インデントガイド
  use 'lukas-reineke/indent-blankline.nvim'

  -- ===============================================
  -- 言語固有・開発支援
  -- ===============================================
  -- Markdown関連
  use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}

  use {
    '0x00-ketsu/markdown-preview.nvim',
    ft = {'md', 'markdown', 'mkd', 'mkdn', 'mdwn', 'mdown', 'mdtxt', 'mdtext', 'rmd', 'wiki'},
    config = function()
      require('markdown-preview').setup {}
    end
  }

  -- リンター・フォーマッター
  use 'dense-analysis/ale'

  -- COC（必要に応じて）
  use {'neoclide/coc.nvim', branch = 'release', opt = true}

end)

-- 自動的にプラグインのインストールと同期
if packer_bootstrap then
  require('packer').sync()
end

