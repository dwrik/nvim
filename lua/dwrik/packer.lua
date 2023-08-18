vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- packer, plugin manager
    use { 'wbthomason/packer.nvim' }

    -- telescope, fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- fzf native for telescope, faster fuzzy finder algorithm for telescope
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- colorschemes
    use { 'rose-pine/neovim', as = 'rose-pine' } -- rose-pine
    use { 'sainnhe/everforest' }                 -- everforest

    -- treesitter, syntax tree parser
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- undotree, visualize vim's undo history
    use { 'mbbill/undotree' }

    -- fugitive, git plugin
    use { 'tpope/vim-fugitive' }

    -- lsp-zero, configure all things related to lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- lsp support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim',          run = function() pcall(vim.api.nvim_command, 'MasonUpdate') end },
            { 'williamboman/mason-lspconfig.nvim' },

            -- autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    -- jdtls, java language server
    use { 'mfussenegger/nvim-jdtls' }

    -- lspkind, icons for lsp completion items
    use { 'onsails/lspkind.nvim' }

    -- bufferline, buffer bar (top)
    use {
        'akinsho/bufferline.nvim',
        tag = '*',
        requires = { 'nvim-tree/nvim-web-devicons' },
    }

    -- lualine, status bar (bottom)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    }

    -- nvterm, terminal
    use { 'NvChad/nvterm' }

    -- nvim-tree, file tree
    use { 'kyazdani42/nvim-tree.lua' }

    -- trouble, pretty list
    use {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    }

    -- zenmode, distraction free editing space
    use { 'folke/zen-mode.nvim' }

    -- delimitmate, bracket completion
    use { 'Raimondi/delimitMate' }

    -- comments, comment shortcut
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- gitsigns, git changes on sidebar
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    -- alpha, home screen dashboard
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    }

    -- vim-bbye, keep splits intact while deleting buffers
    use { 'moll/vim-bbye' }
end)
