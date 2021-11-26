if vim.g.vscode then
  vim.cmd('source ~/.config/nvim/vimscript/nv-vscode/init.vim')
  require('settings')
else
  require('plugins')
  require('kit-cmp')
  -- LSP
  --require('lsp.lsp-common').config_all_ls()
  --require('lsp.lua-ls')
end
