--local use = require('packer').use
--require('packer').startup(function()
--  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
--  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
--  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
--  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
--  use 'L3MON4D3/LuaSnip' -- Snippets plugin
--end)

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
--local nvim_lsp = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
--local servers = {
--  'jsonls',
--  'gopls',
--  'html',
--  'bashls',
--  'dockerls',
--  'jdtls',
--  'kotlin_language_server',
--  'pyright',
--}

--for _, lsp in ipairs(servers) do
--  nvim_lsp[lsp].setup {
--    on_attach = require('lsp.config').on_attach,
--    capabilities = capabilities,
--  }
--end
--

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require('lsp.config').on_attach,
    capabilities = capabilities,
  }

  -- (optional) Customize the options passed to the server
  -- if server.name == "tsserver" then
  --     opts.root_dir = function() ... end
  -- end

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
