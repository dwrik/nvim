-----------------------------------------------------------
-- indent line configuration
-----------------------------------------------------------

-- plugin: indent-blankline
-- url: https://github.com/lukas-reineke/indent-blankline.nvim

local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then
    return
end

indent_blankline.setup {
    char = '▏',
    use_treesitter = true,
    show_first_indent_level = false,
    filetype_exclude = {
        'dashboard',
        'markdown',
        'terminal',
        'lspinfo',
        'packer',
        'text',
        'help',
        'git',
        'NvimTree',
    },
    buftype_exclude = {
        'terminal',
        'nofile',
    },
}
