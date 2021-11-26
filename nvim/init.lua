if vim.g.vscode then
  vim.cmd('source ~/.config/nvim/vimscript/nv-vscode/init.vim')
  require('settings')
else
  require('plugins')
  require('keymappings')
  require('settings')
  require('lsp')
  require('theme')
  -- LSP
  --require('lsp.lsp-common').config_all_ls()
  --require('lsp.lua-ls')
end
