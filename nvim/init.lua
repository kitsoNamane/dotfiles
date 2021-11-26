if vim.g.vscode then
  vim.cmd('source ~/.config/nvim/vimscript/nv-vscode/init.vim')
  require('settings')
else
  require('plugins')
  require('key-mappings')
  require('plugin-key-mappings')
  require('settings')
  require('explorer')
  require('miscellaneous')
  require('lsp')
  require('lsp.lua-ls')
  require('theme')
end
