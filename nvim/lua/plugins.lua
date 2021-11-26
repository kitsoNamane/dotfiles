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

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

  -- Information
  use 'nanotee/nvim-lua-guide'

  -- Quality of life improvements
  use 'norcalli/nvim_utils'

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use 'onsails/lspkind-nvim'
  --use "saadparwaiz1/cmp_luasnip"

  use 'voldikss/vim-floaterm'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  --  Debugging
  use 'mfussenegger/nvim-dap'

  --  Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Status Line and Bufferline
  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    -- config = function() require'my_statusline' end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'romgrk/barbar.nvim'
  use 'ojroques/nvim-bufdel'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'

  -- Color
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'norcalli/nvim-colorizer.lua'
  use 'tjdevries/colorbuddy.nvim'
  use 'Th3Whit3Wolf/onebuddy'
  use 'windwp/nvim-autopairs'
  
end)