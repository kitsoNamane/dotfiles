local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  sources = {
    --{ name = 'gh_issues' },
    { name = 'nvim_lua' },

    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
    -- keyword_length will only trigger completion when typed letters equal the
    -- length set below.
    { name = 'buffer', keyword_length = 5 },
  },

  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-y>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
    },
    ["<c-space>"] = cmp.mapping.complete(),
  },

  snippet = {
    expand = function (args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
        --gh_issues = "[issues]",
      },
    },
  },

  experimental = {
    native_menu = false,
    ghost_text = true,
  },
})