-----------------------------------------------------------
-- status line configuration
-----------------------------------------------------------

-- plugin: lualine
-- url: https://github.com/nvim-lualine/lualine.nvim

local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

lualine.setup {
  options = {
    theme = 'auto',
    globalstatus = true,
    disabled_filetypes = { 'NvimTree' },

    component_separators = '|',
    section_separators = '',

    -- section_separators = { left = '', right = '' },
    -- component_separators = { left = '', right = '' }

    -- component_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
  }
}
