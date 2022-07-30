-----------------------------------------------------------
-- bufferline configuration
----------------------------------------------------------

-- plugin: bufferline
-- url: https://github.com/akinsho/bufferline.nvim

local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
    return
end

bufferline.setup {
    options = {
        mode = 'buffers',
        show_close_icon = false,
        always_show_bufferline = false,
        right_mouse_command = nil,
        middle_mouse_command = nil,
        close_command = 'Bdelete! %d',
        left_mouse_command = 'buffer %d',
        diagnostics_update_in_insert = false,
        diagnostics = "coc",
        offsets = { { filetype = 'NvimTree', text = '' } },
    }
}
