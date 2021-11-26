-- nvim-cmp highlight groups.
--local Group = require('colorbuddy.group').Group
--local g = require('colorbuddy.group').groups
--local s = require('colorbuddy.style').styles

--Group.new("CmpItemAbbr", g.Comment)
--Group.new("CmpItemAbbrDeprecated", g.Error)
--Group.new("CmpItemAbbrMatchFuzzy", g.CmpItemAbbr.fg:dark(), nil, s.italic)
--Group.new("CmpItemKind", g.Special)
--Group.new("CmpItemMenu", g.NonText)

vim.cmd('colorscheme nvcode')
vim.cmd('let g:nvcode_termcolors=256')
vim.cmd('au TextYankPost * lua vim.highlight.on_yank {on_visual = false}')  -- disabled in visual mode

require('theme.statusline')