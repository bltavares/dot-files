set autoindent     " Automatic indent text while creating new lines
set autowrite      " Writes on make/shell commands
set confirm        " Prompt for options when the buffer is unread for unsafe operations
set hidden         " Allow buffers to go to background without saving
set history=256    " Number of things to remember in history.
set hlsearch       " hilight searches by default
set incsearch      " find the next match as we type the search
set laststatus=2   " Always show status line
set nowrap         " Don't wrap lines
set number         " Line numbers on
set relativenumber " Display lines relative to your current line
set ruler          " Display the percentage of your current location given the size of the file
set showcmd        " show incomplete commands on the bottom right
set showmode       " show current mode on bottm left
set timeoutlen=500 " Time to wait after ESC (default causes an annoying delay)

set backupdir=~/.vim/backup,/tmp " Store backup out of the current folder
set directory=~/.vim/backup,/tmp "Store the swap ouf of the current folder

set noerrorbells  " Don't blink screen on errors
set novisualbell  " Don't blink the screen

set backspace=indent,eol,start " Backspace over auto indentation, back a line and to the begining of insert
set expandtab                  " Use spaces instead of tabs to insert tabs
set shiftwidth=2               " Tabs under smart indent
set smarttab                   " When tab, insert blanks according to shiftwidth
set tabstop=2                  " Tabs are 2 spaces

set list        " Display hidden text according to listchars
set showbreak=↪ " Character to display on te begining of a wrapped line
set showmatch   " Show matching brackets.
set listchars=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<

if has("wildmenu")
  set wildmenu                   " Cycle through command autocompletion options
  set wildmode=longest:full,full " Start wildmenu with the longest, then the next full match
endif

if has('gui_running')
  set lines=40      " Start the window with 40 lines
  set guioptions-=T " remove the toolbar
endif


set mouse=a   " Enable mouse
set mousehide " Hide mouse after chars typed

set background=dark
colors solarized

set foldmethod=indent " fold based on indent
set foldnestmax=3     " Maximum nested folds
set nofoldenable      " dont fold by default
