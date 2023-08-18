-- change leader
vim.g.mapleader = ' '

-- don't move cursor on join
vim.keymap.set('n', 'J', 'mzJ`z')

-- keep cursor centered when moving up/down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- keep cursor centered when going through searches
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- skip list navigation
--vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
--vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
--vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
--vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- change split orientation
vim.keymap.set('n', '<leader>H', '<C-w>t<C-w>K') -- change vertical to horizontal
vim.keymap.set('n', '<leader>K', '<C-w>t<C-w>H') -- change horizontal to vertical

-- move around splits using ctrl + {h,j,k,l}
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- resize splits
vim.keymap.set('n', '<leader>k', ':resize +2<CR>')
vim.keymap.set('n', '<leader>j', ':resize -2<CR>')
vim.keymap.set('n', '<leader>l', ':vertical resize +2<CR>')
vim.keymap.set('n', '<leader>h', ':vertical resize -2<CR>')
vim.keymap.set('n', '<leader>m', ':resize<CR>')

-- remove highlight
vim.keymap.set('n', '//', ':noh<CR>')

-- navigate b/w buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>')
vim.keymap.set('n', '<S-h>', ':bprevious<CR>')
vim.keymap.set('n', 'gb', ':BufferLinePick<CR>')

-- close buffer
vim.keymap.set('n', '<S-q>', ':Bdelete! %<CR>')

-- reload nvim config without restart
vim.keymap.set('n', '<leader>rc', ':so %<CR>')

-- close all windows and exit from neovim
vim.keymap.set('n', '<leader>qq', ':qa!<CR>')
