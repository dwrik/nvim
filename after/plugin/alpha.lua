local alpha = require('alpha')
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
	'                                                    ',
	'                                                    ',
	'                 dwrik\'s build of                  ',
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
	dashboard.button('e', '  New File', ':ene <BAR> startinsert<CR>'),
	dashboard.button('f', '  File Explorer', ':NvimTreeOpen<CR>'),
	dashboard.button('c', '  Configuration', ':cd $HOME/.config/nvim <BAR> :e $MYVIMRC<CR>'),
	dashboard.button('u', '  Update Plugins', ':PackerUpdate<CR>'),
	dashboard.button('q', '  Quit', ':qa<CR>'),
}

dashboard.section.footer.val = footer()
alpha.setup(dashboard.config)
