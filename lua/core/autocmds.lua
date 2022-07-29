------------------------
-- autocommands
------------------------

-- define autocommands with lua apis
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- create autocommand

-- highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    group = 'YankHighlight',
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '200' })
    end
})

-- remove whitespace on save
autocmd('BufWritePre', {
    pattern = '*',
    command = ':%s/\\s\\+$//e'
})

-- organize imports on save (golang)
autocmd('BufWritePre', {
    pattern = '*.go',
    command = ":silent call CocAction('runCommand', 'editor.action.organizeImport')"
})

-- set sane defaults for terminal
autocmd('TermOpen', {
    command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})

-- enter insert mode when switching to terminal
autocmd('TermOpen', {
    pattern = '*',
    command = 'startinsert'
})

-- close terminal buffer on process exit
autocmd('BufLeave', {
    pattern = 'term://*',
    command = 'stopinsert'
})
