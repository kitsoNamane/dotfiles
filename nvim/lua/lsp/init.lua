-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require('lsp.handlers').on_attach,
    capabilities = require('lsp.handlers').capabilities,
  }

  -- (optional) Customize the options passed to the server
  if server.name == "sumneko_lua" then
     opts.settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = vim.split(package.path, ';')
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim', 'use'}
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
	    [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
	  }
        }
      }
    }
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)



-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
-- local luasnip = require 'luasnip'

-- nvim-cmp setup
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
    { name = 'vsnip' },
    { name = 'emoji' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    --{ name = 'luasnip' },
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
      vim.fn["vsnip#anonymous"](args.body)
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

require("lsp.handlers").setup()
