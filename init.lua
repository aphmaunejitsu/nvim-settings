-- 環境検出
local env = require("env")

-- 基本設定の読み込み
require("base")
require("option")

-- プラグイン設定（環境に応じて分岐）
if env.terminal() then
  -- ターミナル環境では全てのプラグインを読み込み
  require("plugins")
  
  -- テーマ設定
  require("colorscheme")
  
  -- プラグインの個別設定
  require("config.nvim-cmp")
  require("config.lsp")
  require("config.telescope")
  require("config.treesitter")
  require("config.basic-plugins")
elseif env.vscode() then
  -- VSCode環境では最小限の設定のみ
  require("plugins-vscode")
  
  -- VSCode用基本プラグイン設定
  require("config.basic-plugins-vscode")
end

-- キーマップ設定（環境に応じて分岐）
require("keymaps")
