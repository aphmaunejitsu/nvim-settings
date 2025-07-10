-- VSCode環境用のプラグイン設定
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

  -- VSCode環境では最小限のプラグインのみ
  
  -- ペアの自動補完（VSCodeでも有用）
  use 'windwp/nvim-autopairs'

  -- コメントトグル（VSCodeでも有用）
  use 'numToStr/Comment.nvim'

  -- テキストオブジェクト操作（VSCodeでも有用）
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        -- 最小限の設定
        ensure_installed = { "lua", "vim", "vimdoc" },
        highlight = { enable = false }, -- VSCodeのハイライトを使用
        indent = { enable = false },    -- VSCodeのインデントを使用
      }
    end
  }

  -- GitHub Copilot（VSCodeでも有用）
  use 'github/copilot.vim'

end)

-- 自動的にプラグインのインストールと同期
if packer_bootstrap then
  require('packer').sync()
end
