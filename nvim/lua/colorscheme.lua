vim.cmd('colorscheme nvcode')
vim.cmd('let g:nvcode_termcolors=256')



vim.cmd('au TextYankPost * lua vim.highlight.on_yank {on_visual = false}')  -- disabled in visual mode
