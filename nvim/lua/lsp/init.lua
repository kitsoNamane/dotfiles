local lspkind = require('lspkind')
require('lspkind').init({
   with_text = true,
   symbol_map = {
     Keyword = '',
     Variable = '',
     Text = '',
     Method = '',
     Function = 'ƒ',
     Constructor = '',
     Class = '',
     Interface = '',
     Module = '',
     Property = '',
     Unit = '',
     Value = '',
     Enum = '',
     Snippet = '',
     Color = '',
     File = '',
     Folder = '',
     EnumMember = '',
     Constant = '',
     Struct = 'פּ',
     Operator= 'Ψ',
     Reference= '渚',
     Field= '料',
     Event= '鬒',
     TypeParameter= '',
     Default= ''
   },
   preset = 'codicons',
})

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
    { name = 'buffer', keyword_length = 3 },
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
    },
  },

  experimental = {
    native_menu = false,
    ghost_text = true,
  },
})
