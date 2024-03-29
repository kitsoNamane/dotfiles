vim.opt.iskeyword:append "-"               --treat dash separated words as a word text object"
vim.opt.shortmess:append "c"               --Don't pass messages to |ins-completion-menu|.
vim.cmd('set whichwrap+=<,>,[,],h,l')
vim.cmd('au TextYankPost * lua vim.highlight.on_yank {on_visual = false}')  -- disabled in visual mode

vim.opt.hidden=true                         --Required to keep multiple buffers open multiple buffers
vim.opt.expandtab=true                      --Converts tabs to spaces
vim.opt.tabstop=4                           --Insert 2 spaces for a tab
vim.opt.softtabstop=4                       --Insert 2 spaces when <TAB> key is pressed
vim.opt.shiftwidth=4                        --Change the number of space characters inserted for indentation
vim.opt.encoding="utf-8"                    --The encoding displayed
vim.opt.pumheight=10                        --Makes popup menu smaller
vim.opt.fileencoding="utf-8"                --The encoding written to file
vim.opt.ruler=true              		        -- Show the cursor position all the time
vim.opt.cmdheight=2                         --More space for displaying messages
vim.opt.mouse="a"                           --Enable your mouse
vim.opt.splitbelow=true                     --Horizontal splits will automatically be below
vim.go.termguicolors=true
vim.o.splitright=true                     --Vertical splits will automatically be to the right
vim.go.t_Co="256"                          --Support 256 colors
vim.o.conceallevel=0                      --So that I can see `` in markdown files
vim.o.smarttab=true                       --Makes tabbing smarter will realize you have 2 vs 4
vim.o.smartindent=true                    --Makes indenting smart
vim.o.autoindent=true                     --Good auto indent
vim.o.laststatus=2                        --Always display the status line


vim.o.cursorline=true                     --Enable highlighting of the current line
vim.o.background="dark"                   --tell vim what the background color looks like
vim.o.showtabline=2                       --Always show tabs
vim.o.showmode=false                      --We don't need to see things like -- INSERT -- anymore
vim.o.backup=true                         --This is recommended by coc
vim.o.writebackup=true                    --This is recommended by coc
vim.o.updatetime=300                      --Faster completion
vim.o.timeoutlen=100                      --By default timeoutlen is 1000 ms
vim.o.clipboard="unnamedplus"             --Copy paste between vim and everything else
vim.o.incsearch=true
vim.o.guifont="Hack\\ Nerd\\ Font"
vim.o.undodir="/home/kitso/.local/share/nvim/undo"
vim.o.directory="/home/kitso/.local/share/nvim/swap"
vim.o.backupdir="/home/kitso/.local/share/nvim/backup"

vim.wo.wrap=false                         --Display long lines as just one line
vim.wo.number=true
vim.wo.signcolumn="yes"                   --Always show the signcolumn, otherwise it would shift the text each time
