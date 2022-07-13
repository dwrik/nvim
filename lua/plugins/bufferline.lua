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
    close_command = 'Bdelete! %d',
    left_mouse_command = 'buffer %d',
    right_mouse_command = nil,
    middle_mouse_command = nil,
    diagnostics = "coc",
    diagnostics_update_in_insert = false,
    show_close_icon = false,
    offsets = {{ filetype = 'NvimTree', text = '' }}, -- {{ text_align='left' | 'center' | 'right' }}
  }
}
