-----------------------------------------------------------
-- terminal configuration
-----------------------------------------------------------

-- plugin: nvterm
-- url: https://github.com/NvChad/nvterm

local status_ok, nvterm = pcall(require, 'nvterm')
if not status_ok then
    return
end

nvterm.setup {
    terminals = {
        list = {},
        type_opts = {
            float = {
                relative = 'editor',
                row = 0.15,
                col = 0.15,
                width = 0.7,
                height = 0.7,
                border = 'rounded',
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

-- run code based on filetype
local ft_cmds = {
    python = 'python3 ' .. vim.fn.expand('%'),
    java = 'javac-algs4 ' .. vim.fn.expand('%') .. ' && java-algs4 ' .. vim.fn.expand('%:t:r')
}

local terminal = require("nvterm.terminal")
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader>rr', function() terminal.send(ft_cmds[vim.bo.filetype], 'vertical') end, opts)
