-- nvim-cmp (補完) の設定
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  -- スニペットの展開方法を設定
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  
  -- 補完メニューの外観設定
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  
  -- キーマッピング
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- Tab と Shift-Tab で候補を移動
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),

  -- 補完ソースの優先順位
  sources = cmp.config.sources({
    { name = 'copilot' },    -- Copilot の候補を最優先
    { name = 'nvim_lsp' },   -- LSP からの候補
    { name = 'luasnip' },    -- スニペットからの候補
    { name = 'buffer' },     -- 現在のバッファ内の単語
    { name = 'path' },       -- ファイルパス
  }),
})

-- LuaSnip の設定
require('luasnip.loaders.from_vscode').lazy_load()
