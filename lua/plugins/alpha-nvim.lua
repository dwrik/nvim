-----------------------------------------------------------
-- dashboard configuration
-----------------------------------------------------------

-- plugin: alpha-nvim
-- url: https://github.com/goolord/alpha-nvim

-- for configuration examples see: https://github.com/goolord/alpha-nvim/discussions/16

local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')

-- footer
local function footer()
  local version = vim.version()
  local print_version = 'v' .. version.major .. '.' .. version.minor .. '.' .. version.patch
  local datetime = os.date('%d/%m/%Y %I:%M %p')
  return print_version .. ' ' .. datetime
end

-- banner
local banner = {
  '                                                    ',
  '                                                    ',
  '                                                    ',
  '                                                    ',
  '                                                    ',
  '                                                    ',
  '                                                    ',
  '                                                    ',
  '                                                    ',
  '                                                    ',
  ' ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
  ' ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
  ' ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
  ' ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
  ' ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
  ' ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
  '                                                    ',
}

dashboard.section.header.val = banner

-- menu
dashboard.section.buttons.val = {
  dashboard.button('n', '  New File', ':ene <BAR> startinsert<CR>'),
  dashboard.button('f', '  File Explorer', ':NvimTreeOpen<CR>'),
  dashboard.button('c', '  Configuration', ':cd $HOME/.config/nvim <BAR> :e $MYVIMRC<CR>'),
  dashboard.button('u', '  Update Plugins', ':PackerUpdate<CR>'),
  dashboard.button('q', '  Quit', ':qa<CR>'),
}

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)
