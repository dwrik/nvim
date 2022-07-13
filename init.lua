require('packer_init')

require('core.options')
require('core.autocmds')
require('core.keymaps')
require('core.colors')

require('plugins.lualine')
require('plugins.bufferline')
require('plugins.telescope')
require('plugins.comment')
require('plugins.nvterm')
require('plugins.nvim-tree')
require('plugins.nvim-treesitter')
require('plugins.indent-blankline')
require('plugins.alpha-nvim')

vim.cmd('source $HOME/.config/nvim/coc.vim')
