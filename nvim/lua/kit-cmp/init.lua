local lspkind = require('lspkind')
lspkind.init()

local cmp = require('cmp')

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
    ["<C-o>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
    },
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
vim.api.nvim_command("autocmd FileType lua lua require'cmp'.setup.buffer{sources = {{ name = 'nvim_lua' }, { name = 'buffer' }}}")