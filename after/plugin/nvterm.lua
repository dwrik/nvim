-- nvterm terminal type key bindings
vim.keymap.set('n', '<leader>i', ":lua require('nvterm.terminal').toggle 'float'<CR>")
vim.keymap.set('n', '<leader>t', ":lua require('nvterm.terminal').toggle 'horizontal'<CR>")
vim.keymap.set('n', '<leader>v', ":lua require('nvterm.terminal').toggle 'vertical'<CR>")
vim.keymap.set('n', '<leader>nt', ":lua require('nvterm.terminal').new 'horizontal'<CR>")
vim.keymap.set('n', '<leader>nv', ":lua require('nvterm.terminal').new 'vertical'<CR>")

-- nvterm move around splits key bindings using ctrl + {h,j,k,l} without exiting term mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l')

require('nvterm').setup {
    terminals = {
        list = {},
        type_opts = {
            float = {
                relative = 'editor',
                row = 0.15,
                col = 0.15,
                width = 0.7,
                height = 0.7,
                border = 'solid',
            },
            horizontal = { location = 'rightbelow', split_ratio = .3, },
            vertical = { location = 'rightbelow', split_ratio = .4 },
        }
    },
    behavior = {
        autoclose_on_quit = {
            enabled = false,
            confirm = true,
        },
        close_on_exit = true,
        auto_insert = true,
    },
}
