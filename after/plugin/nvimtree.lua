-- nvimtree key binding
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')

require('nvim-tree').setup {
    renderer = {
        icons = {
            show = {
                git = false, -- don't show git signs in file explorer
            }
        }
    },
}
