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

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  },
  rainbow = {
    enable = true
  },
  refactor = {
      highlight_definitions = {
        enable = true
      }
   }
}
