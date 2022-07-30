-----------------------------------------------------------
-- telescope configuration
-----------------------------------------------------------

-- plugin: telescope
-- url: https://github.com/nvim-telescope/telescope.nvim

local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    return
end

local actions = require 'telescope.actions'
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

require('telescope').load_extension('fzf')
