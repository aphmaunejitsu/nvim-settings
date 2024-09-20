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

-- vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- plugins
  use { "catppuccin/nvim", as = "catppuccin" }
  use { 
	'nvim-lualine/lualine.nvim',
    config = function()
        require 'option/lualine'
    end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }

  use { 'dense-analysis/ale'}

  use {'neoclide/coc.nvim', branch = 'release'}
  use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}

  use {
    '0x00-ketsu/markdown-preview.nvim',
    ft = {'md', 
      'markdown', 
      'mkd', 
      'mkdn', 
      'mdwn', 
      'mdown', 
      'mdtxt', 
      'mdtext', 
      'rmd', 
      'wiki'
    },
    config = function()
      require('markdown-preview').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the setup section below
      }
    end
  }

  use {
    'nvim-tree/nvim-tree.lua',
    config = function() 
        require 'option/nvim-tree' 
    end,
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

end)


