-----------------------------------------------------------
-- file manager configuration
-----------------------------------------------------------

-- plugin: nvim-tree
-- url: https://github.com/kyazdani42/nvim-tree.lua

local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end
local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
    view = {
        mappings = {
            list = { -- custom mappings
                { key = 'l', cb = tree_cb 'edit' },
                { key = 'h', cb = tree_cb 'close_node' },
            }
        }
    },
    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                item = "│ ",
                none = "  ",
            },
        },
        icons = {
            show = {
                git = false,
            }
        }
    }
}
