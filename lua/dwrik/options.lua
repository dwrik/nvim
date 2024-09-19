-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- prevent words from splitting due to wrap
vim.opt.linebreak = true

-- true colors
-- vim.opt.termguicolors = true

-- backup & undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

-- merge with system clipboard
vim.opt.clipboard = vim.opt.clipboard + { 'unnamedplus' }

-- line number
vim.opt.number = true
vim.opt.relativenumber = true

-- scroll offset
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- splits
vim.opt.splitright = true     -- vertical split to the right
vim.opt.splitbelow = true     -- horizontal split to the bottom

-- search
vim.opt.ignorecase = true     -- ignore case letters when searching
vim.opt.smartcase = true      -- override ignorecase if searching using upper case

-- folds
vim.opt.foldmethod = 'manual' -- fold based on indent
vim.opt.foldlevelstart = 1    -- close all folds on start

-- misc
vim.opt.showmatch = true      -- highlight matching parenthesis
vim.opt.fillchars = 'eob: '   -- change '~' to space at end of buffer
vim.opt.signcolumn = 'yes'    -- always show sign column to prevent shift

-- performance
vim.opt.updatetime = 300      -- event trigger timeout
vim.opt.timeoutlen = 500      -- keymap trigger timeout

-- file format (line endings etc.)
vim.opt.fileformat = 'unix'

