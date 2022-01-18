-- nvim-cmp highlight groups.
--local Group = require('colorbuddy.group').Group
--local g = require('colorbuddy.group').groups
--local s = require('colorbuddy.style').styles

--Group.new("CmpItemAbbr", g.Comment)
--Group.new("CmpItemAbbrDeprecated", g.Error)
--Group.new("CmpItemAbbrMatchFuzzy", g.CmpItemAbbr.fg:dark(), nil, s.italic)
--Group.new("CmpItemKind", g.Special)
--Group.new("CmpItemMenu", g.NonText)

--vim.cmd('colorscheme nvcode')
--vim.cmd('let g:nvcode_termcolors=256')
local onedarkpro = require('onedarkpro')
onedarkpro.setup({
  colors = {"onedark"}, -- Override default colors. Can specify colors for "onelight" or "onedark" themes
  options = {
      bold = true, -- Use the themes opinionated bold styles?
      italic = true, -- Use the themes opinionated italic styles?
      underline = true, -- Use the themes opinionated underline styles?
      undercurl = true, -- Use the themes opinionated undercurl styles?
      cursorline = false, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
      window_unfocussed_color = true, -- When the window is out of focus, change the normal background?
  }
})
onedarkpro.load()
vim.cmd('au TextYankPost * lua vim.highlight.on_yank {on_visual = false}')  -- disabled in visual mode

require('theme.statusline')
require('theme.bufferline')

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
