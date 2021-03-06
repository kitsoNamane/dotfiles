if vim.g.vscode then
  vim.cmd('source ~/.config/nvim/vimscript/nv-vscode/init.vim')
  require('settings')
else
  -- General mappings
  require('plugins')
  require('keymappings')
  require('settings')
  require('colorscheme')

  -- Plugins
  require('nv-barbar')
  require('nv-compe')
  require('nv-colorizer')
  require('nv-comment')
  require('nv-floaterm')
  require('nv-galaxyline')
  require('nv-gitsigns')
  require('nv-lspkind')
  require('nv-nvim-autopairs')
  require('nv-nvimtree')
  require('nv-quickscope')
  require('nv-telescope')
  require('nv-treesitter')
  require('nv-vim-rooter')

  -- Which Key (Hope to replace with Lua plugin someday)
  vim.cmd('source ~/.config/nvim/vimscript/nv-whichkey/init.vim')
  --vim.cmd('source ~/.config/nvim/vimscript/functions.vim')

  -- LSP
  require('lsp.lsp-common').config_all_ls()
  require('lsp.lua-ls')
  require('lsp.flutter-ls')
  require('lsp.sql-ls')
  --require('lsp.bash-ls')
  --require('lsp.js-ts-ls')
  --require('lsp.python-ls')
  --require('lsp.json-ls')
  --require('lsp.yaml-ls')
  --require('lsp.vim-ls')
  --require('lsp.graphql-ls')
  --require('lsp.css-ls')
  --require('lsp.docker-ls')
  --require('lsp.html-ls')
  --require('lsp.efm-general-ls')
end

