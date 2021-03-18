local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim'}

  -- Information
  use 'nanotee/nvim-lua-guide'

  -- Quality of life improvements
  use 'norcalli/nvim_utils'

  --  LSP
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  use 'kosayoda/nvim-lightbulb'
  use 'akinsho/flutter-tools.nvim'

  -- Autocomplete
  use 'hrsh7th/nvim-compe'

  -- Snippets
  use 'SirVer/ultisnips'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'honza/vim-snippets'

  --  Debugging
  use 'mfussenegger/nvim-dap'

  use {'npxbr/glow.nvim', run = ':GlowInstall'}

  --  Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use 'p00f/nvim-ts-rainbow'
  --
  --  Icons
  use 'kyazdani42/nvim-web-devicons'


 -- Status Line and Bufferline
  use 'glepnir/galaxyline.nvim'
  -- use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use 'romgrk/barbar.nvim'
  use 'ojroques/nvim-bufdel'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- Explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Color
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'norcalli/nvim-colorizer.lua'

  -- Git
  use 'TimUntersberger/neogit'
  use {'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- General Plugins
  use 'b3nj5m1n/kommentary'
  use 'terrortylor/nvim-comment'
  use 'akinsho/nvim-toggleterm.lua'
  use 'voldikss/vim-floaterm'
  use 'liuchengxu/vim-which-key'
  use 'windwp/nvim-autopairs'
  use 'kevinhwang91/nvim-bqf'
  use 'psliwka/vim-smoothie'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-surround'
  --use 'RRethy/vim-illuminate'
end)
