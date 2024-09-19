-- trouble key bindings
vim.keymap.set('n', '<leader>xx', function() require('trouble').toggle() end)
vim.keymap.set('n', '<leader>wd', function() require('trouble').toggle('workspace_diagnostics') end)
vim.keymap.set('n', '<leader>dd', function() require('trouble').toggle('document_diagnostics') end)
vim.keymap.set('n', '<leader>qf', function() require('trouble').toggle('quickfix') end)
vim.keymap.set('n', '<leader>xl', function() require('trouble').toggle('loclist') end)
vim.keymap.set('n', 'gr', function() require('trouble').toggle('lsp_references') end)
