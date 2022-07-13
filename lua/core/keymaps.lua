-----------------------------------------------------------
-- keymaps of neovim and installed plugins
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- change leader to space
map('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-----------------------------------------------------------
-- neovim mappings
-----------------------------------------------------------

-- change split orientation
map('n', '<Leader>H', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<Leader>K', '<C-w>t<C-w>H') -- change horizontal to vertical

-- move around splits using ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- resize splits
map('n', '<Leader>k', ':resize +2<CR>')
map('n', '<Leader>j', ':resize -2<CR>')
map('n', '<Leader>l', ':vertical resize +2<CR>')
map('n', '<Leader>h', ':vertical resize -2<CR>')

-- remove highlight
map('n', '//', ':noh<CR>')

-- navigate buffers
map('n', '<S-l>', ':bnext<CR>')
map('n', '<S-h>', ':bprevious<CR>')

-- close buffer
map('n', '<S-q>', ':Bdelete! %<CR>')

-- reload configuration without restart nvim
map('n', '<Leader>rc', ':so %<CR>')

-- close all windows and exit from neovim
map('n', '<Leader>qq', ':qa!<CR>')

-----------------------------------------------------------
-- plugins mappings
-----------------------------------------------------------

-- terminal normal mode with Esc
map('t', '<Esc>', '<C-\\><C-n>')

-- move around splits using ctrl + {h,j,k,l} without exiting term mode
map('t', '<C-h>', '<C-\\><C-N><C-w>h')
map('t', '<C-j>', '<C-\\><C-N><C-w>j')
map('t', '<C-k>', '<C-\\><C-N><C-w>k')
map('t', '<C-l>', '<C-\\><C-N><C-w>l')

-- nvterm
-- p.s. run code based on filetype binding in plugins/nvterm.lua
map('n', '<Leader>i', ":lua require('nvterm.terminal').toggle 'float'<CR>")
map('n', '<Leader>t', ":lua require('nvterm.terminal').toggle 'horizontal'<CR>")
map('n', '<Leader>v', ":lua require('nvterm.terminal').toggle 'vertical'<CR>")
map('n', '<Leader>nt', ":lua require('nvterm.terminal').new 'horizontal'<CR>")
map('n', '<Leader>nv', ":lua require('nvterm.terminal').new 'vertical'<CR>")

-- nvimtree
map('n', '<C-n>', ':NvimTreeToggle<CR>')

-- telescope
map('n', '<Leader>f', ':Telescope find_files<CR>')
map('n', '<Leader>g', ':Telescope live_grep<CR>')
map('n', '<Leader>b', ':Telescope current_buffer_fuzzy_find<CR>')
map('n', '<Leader>he', ':Telescope help_tags<CR>')
