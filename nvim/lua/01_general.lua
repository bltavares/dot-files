vim.cmd('filetype plugin on')
vim.o.backup = false
vim.o.clipboard = 'unnamedplus' -- share the OS clipboard
vim.o.conceallevel = 2
vim.o.cursorline = true
vim.o.encoding = 'utf8'
vim.o.modelines = 0
vim.o.mouse = 'a'
vim.o.path = '.,**'
vim.o.pumblend = 25
vim.o.scrollback = 100000
vim.o.scrolloff = 10
vim.o.showmode = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.updatetime = 50
vim.o.wrap = false
vim.o.hidden = true

vim.wo.signcolumn = 'yes' -- permanent sign column to avoid jitter on UI
vim.wo.relativenumber = true -- set both for hybrid numbers
vim.wo.number = true -- set both for hybrid numbers

-- leaders
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- indentation
vim.cmd('filetype plugin indent on')
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true