-- Mason (LSPサーバー管理) とLSPの設定
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    -- 自動インストールするLSPサーバー
    ensure_installed = {
        "lua_ls",           -- Lua
        "pyright",          -- Python
        "tsserver",         -- TypeScript/JavaScript
        "rust_analyzer",    -- Rust
        "gopls",           -- Go
        "clangd",          -- C/C++
        "html",            -- HTML
        "cssls",           -- CSS
        "jsonls",          -- JSON
        "yamlls",          -- YAML
    },
    automatic_installation = true,
})

-- LSP サーバーの設定
local lspconfig = require('lspconfig')

-- 共通のLSP設定
local on_attach = function(client, bufnr)
  -- バッファローカルなキーマップを設定
  local opts = { buffer = bufnr, silent = true }
  
  -- LSP関連のキーマップ
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)
end

-- LSP診断設定
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- 診断記号の設定
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- デフォルトのcapabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 各LSPサーバーの設定
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = { 'vim' } },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = { enable = false },
      },
    },
  },
  pyright = {},
  tsserver = {},
  rust_analyzer = {},
  gopls = {},
  clangd = {},
  html = {},
  cssls = {},
  jsonls = {},
  yamlls = {},
}

-- LSPサーバーの自動設定
for server_name, server_config in pairs(servers) do
  server_config.on_attach = on_attach
  server_config.capabilities = capabilities
  lspconfig[server_name].setup(server_config)
end
