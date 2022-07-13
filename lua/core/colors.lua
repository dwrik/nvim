-----------------------------------------------------------
-- color scheme configuration file
-----------------------------------------------------------

-- available color schemes: onedark, github-theme, base16, tokyonight

---------------------------------
-- tokyonight
---------------------------------
vim.g.tokyonight_style = 'storm'
vim.g.tokyonight_transparent = false
vim.g.tokyonight_lualine_bold = true
vim.g.tokyonight_sidebars = { 'qf', 'vista_kind', 'terminal', 'packer', 'NvimTree' }

---------------------------------
-- colorschemes without lua setup
---------------------------------
local colorscheme = 'tokyonight'
local ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not ok then
  vim.notify('colorscheme' .. colorscheme .. ' not found!')
  return
end

-- require to configure (onedark, github-theme)
-- local status_ok, color_scheme = pcall(require, 'github-theme')
-- if not status_ok then
--   return
-- end

---------------------------------
-- onedark
---------------------------------

-- color_scheme.setup  {
--     -- main options --
--     style = 'warm', -- default theme style choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
--
--     -- toggle theme style ---
--     toggle_style_key = '<Leader>ts', -- Default keybinding to toggle
--     toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- list of styles to toggle between
--
--     -- change code style ---
--     -- options are italic, bold, underline, none
--     -- you can configure multiple style with comma seperated, for e.g., keywords = 'italic,bold'
--     code_style = {
--         comments = 'italic',
--         keywords = 'none',
--         functions = 'none',
--         strings = 'none',
--         variables = 'none'
--     },
--
--     -- plugins config --
--     diagnostics = {
--         darker = false, -- darker colors for diagnostic
--         undercurl = false,   -- use undercurl instead of underline for diagnostics
--         background = true,    -- use background color for virtual text
--     },
-- }
--
-- color_scheme.load()

---------------------------------
-- github-theme
---------------------------------

-- color_scheme.setup({
--   dark_float = true,
--   sidebars = {'qf', 'vista_kind', 'terminal', 'packer', 'NvimTree'},
--   theme_style = 'dark',
-- })
--
-- color_scheme.setup()
