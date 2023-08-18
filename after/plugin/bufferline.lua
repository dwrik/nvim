require('bufferline').setup {
    options = {
        mode = 'buffers',
        show_close_icon = false,
        show_buffer_close_icons = false,
        always_show_bufferline = false,
        right_mouse_command = nil,
        middle_mouse_command = nil,
        close_command = 'Bdelete! %d',
        left_mouse_command = 'buffer %d',
        diagnostics = 'nvim_lsp',
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'NvimTree',
                text_align = 'center' or 'left' or 'right',
                separator = false,
            }
        },
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level)
            local icon =
                level:match('error') and '󰅚'
                or level:match('warn') and ''
                or level:match('hint') and '󰌵'
                or level:match('info') and '' or ''
            return ' ' .. icon .. ' ' .. count
        end,
    },
}
