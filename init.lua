require('dwrik')

local augroup = vim.api.nvim_create_augroup
local dwrikGroup = augroup('dwrikGroup', {})

local autocmd = vim.api.nvim_create_autocmd
local yankGroup = augroup('HighlightYank', {})

---------------------------------------------------------
-- utility autocmds
---------------------------------------------------------

-- highlight yanked text
autocmd('TextYankPost', {
    group = yankGroup,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = '200',
        })
    end
})

-- remove whitespace on save
autocmd('BufWritePre', {
    group = dwrikGroup,
    pattern = '*',
    command = '%s/\\s\\+$//e'
})

-- java io template (copies over FastIO template, renames classname, moves cursor to main)
autocmd('BufNewFile', { pattern = '*.java', command = 'r ~/Programming/templates/Template.java' })
autocmd('BufNewFile', { pattern = '*.java', command = 'call cursor(1, 0) | delete' })
autocmd('BufNewFile', { pattern = '*.java', command = "%s/Template/\\=expand('%:t:r')/g" })
autocmd('BufNewFile', { pattern = '*.java', command = 'call cursor(13, 3)' })

---------------------------------------------------------
-- filetype based code execution keybinding using autocmd
---------------------------------------------------------

local expand = vim.fn.expand
local input_file_binding = '<leader>ri'
local regular_run_binding = '<leader>rr'

-- local c_command = 'cc -O2 -Wall'
-- local python_command = 'python3'
local cpp_command = 'g++ -O2 -Wall'
local java_command = 'javac'

-- cpp
autocmd('BufEnter', {
    pattern = { '*.cpp', '*.c' },
    callback = function(ev)
        -- run code interactively without any input file
        vim.keymap.set('n', regular_run_binding, function()
            require('nvterm.terminal').send(
                cpp_command .. ' ' .. expand('%') .. ' && ' .. (expand('%:h') or '.') .. '/a.out', 'vertical')
        end)

        -- run code using inputs from input.txt
        vim.keymap.set('n', input_file_binding, function()
            require('nvterm.terminal').send(
                cpp_command .. ' ' .. expand('%') ..
                ' && [[ -f input.txt ]] && cat input.txt | ' .. (expand('%:h') or '.') .. '/a.out', 'vertical')
        end)
    end
})

-- java
autocmd('BufEnter', {
    pattern = '*.java',
    callback = function(ev)
        -- run code interactively without any input file
        vim.keymap.set('n', regular_run_binding, function()
            require('nvterm.terminal').send(
                java_command .. ' ' .. expand('%') .. ' && java -cp ' .. expand('%:h') .. ' ' .. expand('%:t:r') .. ' && rm -rf *.class', 'vertical')
        end)

        -- run code using inputs from input.txt
        vim.keymap.set('n', input_file_binding, function()
            require('nvterm.terminal').send(
                java_command .. ' ' .. expand('%') ..
                ' && [[ -f input.txt ]] && cat input.txt | java -cp ' .. expand('%:h') .. ' ' .. expand('%:t:r') .. ' && rm -rf *.class', 'vertical')
        end)
    end
})

-- TODO similarly setup key binding autocmd for c, python, js
