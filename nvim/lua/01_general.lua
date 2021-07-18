vim.o.clipboard = 'unnamedplus' -- share the OS clipboard
vim.o.encoding = 'utf8'
vim.o.modelines = 0
vim.o.path = '.,**'
vim.o.scrolloff = 10
vim.o.smartcase = true -- ignore case if uppercase present on search
vim.o.splitbelow = true -- keep new screens split below
vim.o.splitright = true -- kepp new screens split on right
vim.o.swapfile = false -- avoid clutter backup files
vim.o.backup = false -- avoid clutter backup files
vim.o.updatetime = 50

vim.o.pumblend = 25 -- pseudo-transparency popupmenu
vim.o.cursorline = true -- highlight the current line on buffer
vim.o.showmatch = true -- Show matching brackets.
vim.o.termguicolors = true

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

vim.o.compatible = false
vim.o.autoindent = true -- Automatic indent text while creating new lines
vim.o.autowrite = true -- Writes on make/shell commands
vim.o.confirm = true -- Prompt for options when the buffer is unread for unsafe operations
vim.o.hidden = true -- Allow buffers to go to background without saving
vim.o.history = 256 -- Number of things to remember in history.
vim.o.hlsearch = true -- hilight searches by default
vim.o.incsearch = true -- find the next match as we type the search
vim.o.laststatus = 2 -- Always show status line
vim.o.wrap = false -- Don't wrap lines
vim.o.ruler = true -- Display the percentage of your current location given the size of the file
vim.o.showcmd = true -- show incomplete commands on the bottom right
vim.o.showmode = true -- show current mode on bottm left
vim.o.timeoutlen = 500 -- Time to wait after ESC (default causes an annoying delay)

vim.o.errorbells = false -- Don't blink screen on errors
vim.o.visualbell = false -- Don't blink the screen

vim.o.backspace = "indent,eol,start" -- Backspace over auto indentation, back a line and to the begining of insert
vim.o.expandtab = true -- Use spaces instead of tabs to insert tabs
vim.o.shiftwidth = 2 -- Tabs under smart indent
vim.o.smarttab = true -- When tab, insert blanks according to shiftwidth
vim.o.tabstop = 2 -- Tabs are 2 spaces

vim.o.list = true -- Display hidden text according to listchars
vim.o.conceallevel = 2
vim.o.showbreak = "↪" -- Character to display on te begining of a wrapped line
vim.o.listchars = "tab:> ,eol:$,trail:~,extends:>,precedes:<"

vim.o.wildmenu = true -- Cycle through command autocompletion options
vim.o.wildmode = "longest:full,full" -- Start wildmenu with the longest, then the next full match

vim.o.mouse = "a" -- Enable mouse
vim.g.mousehide = true -- Hide mouse after chars typed

vim.g.neovide_cursor_vfx_mode = "railgun" -- noevide nonsense
