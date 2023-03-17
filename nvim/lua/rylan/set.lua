-- Enforce block cursor
-- vim.opt.guicursor = ""

-- Line numbers configuration
vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 space indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Disable line wrap
vim.opt.wrap = false

-- Give Undo tree plugin access to long-running undos
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Incremental search
-- E.g. /vim only highlights vim or /vim.* highlighting the whole line
-- as you are in search mode
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Always have 8 lines showing as I scroll unless at EOF
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Define leader keys
vim.g.mapleader = ' '
