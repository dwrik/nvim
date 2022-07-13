-----------------------------------------------------------
-- general neovim settings and configuration
-----------------------------------------------------------

-- default options are not included
-- see: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g       -- global variables
local opt = vim.opt   -- set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- general
-----------------------------------------------------------
opt.mouse = 'a'                                    -- enable mouse support
opt.clipboard = opt.clipboard + { 'unnamedplus' }  -- merge system clipboard
opt.swapfile = false                               -- don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'      -- autocomplete options

-----------------------------------------------------------
-- neovim ui
-----------------------------------------------------------
opt.number = true           -- show line number
opt.showmatch = true        -- highlight matching parenthesis
opt.foldmethod = 'indent'   -- enable folding (default 'foldmarker')
opt.foldlevelstart = 99     -- open all folds on start
opt.splitright = true       -- vertical split to the right
opt.splitbelow = true       -- horizontal split to the bottom
opt.ignorecase = true       -- ignore case letters when search
opt.smartcase = true        -- ignore lowercase for the whole pattern
opt.linebreak = true        -- wrap on word boundary
opt.termguicolors = true    -- enable 24-bit rgb colors
opt.laststatus = 2          -- set global statusline
opt.fillchars = 'eob: '     -- change '~' to space at end of buffer
opt.signcolumn = 'yes'      -- always show sign column to prevent shift

-- opt.cmdheight = 2           -- give more space for displaying messages.
-- opt.colorcolumn = '80'      -- line lenght marker at 80 columns

-- change popup scrollbar thumb color (default: white)
-- vim.cmd('highlight PmenuThumb ctermbg=darkyellow guibg=darkyellow')

-----------------------------------------------------------
-- tabs, indent
-----------------------------------------------------------
opt.expandtab = true        -- use spaces instead of tabs
opt.shiftwidth = 2          -- shift 2 spaces when tab
opt.tabstop = 2             -- 1 tab == 2 spaces
opt.scrolloff = 2           -- offset when scroll to top/bottom
opt.sidescrolloff = 2       -- offset when scroll to left/right
opt.smartindent = true      -- autoindent new lines

-----------------------------------------------------------
-- memory, cpu
-----------------------------------------------------------
opt.hidden = true           -- enable background buffers
opt.lazyredraw = true       -- faster scrolling
opt.updatetime = 300        -- ms to wait for trigger an event
opt.timeoutlen = 500        -- ms to wait for keymap

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
