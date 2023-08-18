local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

-- telescope key bindings
vim.keymap.set('n', '<leader>he', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, {})

-- configuration
telescope.setup {
    defaults = {
        prompt_prefix = '  ',
        selection_caret = ' ',
        file_ignore_patterns = {
            -- project directories
            'node_modules',
            'build',
            'public',
            'icons',
            -- home directories
            'Applications',
            'Books',
            'Desktop',
            'Documents',
            'Downloads',
            'Fonts',
            'Library',
            'Movies',
            'Music',
            'Notes',
            'Pictures',
            'Public',
            'Scripts',
            'Videos',
        },
        mappings = {
            i = {
                ['<C-n>'] = actions.cycle_history_next,
                ['<C-p>'] = actions.cycle_history_prev,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-c>'] = actions.close,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or 'ignore_case' or 'respect_case', default is 'smart_case'
        }
    },
}

-- load extensions
telescope.load_extension('fzf')

