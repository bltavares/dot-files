local fn = vim.fn
local execute = vim.api.nvim_command

-- Auto install paq-nvim if not exists
local install_path = fn.stdpath('data') .. '/site/pack/paqs/opt/paq-nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/savq/paq-nvim ' .. install_path)
end
vim.cmd [[packadd paq-nvim]]
local paq = require'paq-nvim'.paq

paq {'savq/paq-nvim', opt = true} -- Let Paq manage itself

paq 'liuchengxu/vim-which-key'
paq 'AckslD/nvim-whichkey-setup.lua'

paq {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} -- Syntax highlighting
paq 'p00f/nvim-ts-rainbow'

paq 'nvim-lua/popup.nvim' -- dependency telescope.nvim
paq 'nvim-lua/plenary.nvim' -- dependency telescope.nvim, flutter.nvim
paq 'nvim-telescope/telescope.nvim' -- Fuzzy finder
paq 'nvim-telescope/telescope-project.nvim'

paq 'kyazdani42/nvim-tree.lua'
paq 'godlygeek/tabular'
paq 'tpope/vim-surround'
paq 'tpope/vim-sleuth'
paq 'tpope/vim-abolish'
paq 'terrortylor/nvim-comment'
paq 'tpope/vim-fugitive'

paq 'neovim/nvim-lspconfig' -- Bult-in LSP
-- paq 'ray-x/lsp_signature.nvim' -- LSP Signature support -- replaced by lspsaga
paq 'nvim-lua/lsp_extensions.nvim' -- LSP type inlay hints
paq 'hrsh7th/vim-vsnip' -- LSP snippet
paq 'hrsh7th/nvim-compe' -- Autocomplete + LSP
paq 'glepnir/lspsaga.nvim' -- cute UI LSP
paq 'nvim-lua/lsp-status.nvim'

-- paq 'liuchengxu/vista.vim' -- requires ctags

paq 'simrat39/rust-tools.nvim' -- rust
paq 'mhinz/vim-crates'

paq 'akinsho/flutter-tools.nvim'

paq 'arcticicestudio/nord-vim' -- theme

-- Initalize systems
require'telescope'.load_extension('project')
require('nvim_comment').setup()
vim.cmd 'colorscheme nord'