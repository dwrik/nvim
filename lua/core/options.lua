-----------------------------------------------------------
-- general neovim settings and configuration
-----------------------------------------------------------

-- default options are not included
-- see: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g -- global variables
local opt = vim.opt -- set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- general
-----------------------------------------------------------

opt.mouse = 'a' -- enable mouse support
opt.swapfile = false -- don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect' -- autocomplete options
opt.clipboard = opt.clipboard + { 'unnamedplus' } -- merge system clipboard

-----------------------------------------------------------
-- neovim ui
-----------------------------------------------------------

opt.number = true -- line number
opt.relativenumber = true -- relative line numbers
opt.laststatus = 2 -- set global statusline
opt.linebreak = true -- wrap on word boundary
opt.termguicolors = true -- enable 24-bit rgb colors
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- horizontal split to the bottom
opt.showmatch = true -- highlight matching parenthesis
opt.ignorecase = true -- ignore case letters when search
opt.smartcase = true -- ignore lowercase for the whole pattern
opt.fillchars = 'eob: ' -- change '~' to space at end of buffer
opt.signcolumn = 'yes' -- always show sign column to prevent shift
opt.foldmethod = 'indent' -- enable folding based on indent level
opt.foldlevelstart = 99 -- open all folds on start

-----------------------------------------------------------
-- tabs, indent
-----------------------------------------------------------

opt.tabstop = 4 -- 1 tab == 4 spaces
opt.expandtab = true -- expand tab to spaces
opt.scrolloff = 4 -- offset vertical scrolling
opt.shiftwidth = 4 -- shift 4 spaces on tab
opt.sidescrolloff = 4 -- offset horizontal scrolling
opt.smartindent = true -- autoindent new lines

-----------------------------------------------------------
-- memory, cpu
-----------------------------------------------------------

opt.hidden = true -- enable hidden buffers
opt.updatetime = 300 -- event trigger timeout
opt.timeoutlen = 500 -- keymap trigger timeout

-----------------------------------------------------------
-- startup
-----------------------------------------------------------

-- disable nvim intro
opt.shortmess:append 'sI'

-- disable builtins plugins
local disabled_built_ins = {
	'netrw',
	'netrwPlugin',
	'netrwSettings',
	'netrwFileHandlers',
	'gzip',
	'zip',
	'zipPlugin',
	'tar',
	'tarPlugin',
	'getscript',
	'getscriptPlugin',
	'vimball',
	'vimballPlugin',
	'2html_plugin',
	'logipat',
	'rrhelper',
	'spellfile_plugin',
	'matchit'
}

for _, plugin in pairs(disabled_built_ins) do
	g['loaded_' .. plugin] = 1
end
