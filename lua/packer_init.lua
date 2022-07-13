------------------------------------
-- plugin manager configuration file
------------------------------------

-- plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- use floating window for packer
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

-- install plugins
return packer.startup(function(use)
  -- plugin manager (packer can manage itself)
  use 'wbthomason/packer.nvim'

  -- file explorer
  use 'kyazdani42/nvim-tree.lua'

  -- fuzzy finder (files, live grep etc.)
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  -- fuzzy finder algorithm for telescope, only load if `make` is available
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  }

  -- show indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- auto-pair brackets
  use 'Raimondi/delimitMate'

  -- comments
  use 'numToStr/Comment.nvim'

  -- set comment type based on cursor location
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- dev icons
  use 'kyazdani42/nvim-web-devicons'

  -- treesitter (syntax parse tree)
  use 'nvim-treesitter/nvim-treesitter'

  -- color schemes
  use 'projekt0n/github-nvim-theme'
  use 'folke/tokyonight.nvim'
  use 'navarasu/onedark.nvim'
  use 'RRethy/nvim-base16'

  -- terminal
  use 'NvChad/nvterm'

  -- completion
  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }

  -- buffer bar (top)
  use {
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- status bar (bottom)
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }

  -- git signs on sidebar
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- dashboard
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

   -- performance fix on autocmd 'CursorHold' event
  use 'antoinemadec/FixCursorHold.nvim'

  -- keep window intact while deleting buffers
  use 'moll/vim-bbye'

  -- automatically set up your configuration after cloning packer.nvim
  -- put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
