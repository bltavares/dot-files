local fn = vim.fn
local execute = vim.api.nvim_command

-- TODO
-- lsp
---- https://github.com/gbrlsnchs/telescope-lsp-handlers.nvim
-- indent blankline
-- debug
---- https://github.com/mfussenegger/nvim-dap
---- https://github.com/theHamsta/nvim-dap-virtual-text
-- https://github.com/windwp/nvim-autopairs
-- https://github.com/lewis6991/spellsitter.nvim
-- https://github.com/oberblastmeister/neuron.nvim
-- ui
---- https://github.com/edluffy/specs.nvim
---- https://github.com/ruifm/gitlinker.nvim
---- https://github.com/andweeb/presence.nvim
-- https://github.com/akinsho/dependency-assist.nvim

-- Auto install paq-nvim if not exists
local install_path = fn.stdpath('data') .. '/site/pack/paqs/opt/paq-nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/savq/paq-nvim ' .. install_path)
end
vim.cmd [[packadd paq-nvim]]
local paq = require'paq-nvim'.paq

paq {'savq/paq-nvim', opt = true} -- Let Paq manage itself

paq 'folke/which-key.nvim'

paq {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} -- Syntax highlighting
paq 'p00f/nvim-ts-rainbow'

paq 'nvim-lua/popup.nvim' -- dependency telescope.nvim
paq 'nvim-lua/plenary.nvim' -- dependency telescope.nvim, flutter.nvim
paq 'nvim-telescope/telescope.nvim' -- Fuzzy finder
-- session/
-- paq 'glepnir/dashboard-nvim' -- TODO make an intro screen
-- paq 'rmagatti/auto-session' -- broken on windows
-- paq 'rmagatti/session-lens'
paq 'nvim-telescope/telescope-project.nvim'
paq 'ahmedkhalf/lsp-rooter.nvim'

paq 'kyazdani42/nvim-tree.lua'
paq 'godlygeek/tabular'
paq 'tpope/vim-surround'
-- lua surround has less features than viml
-- paq 'blackCauldron7/surround.nvim'
-- vim.g.surround_mappings_style = "normal"
-- require"surround".setup{}
paq 'tpope/vim-sleuth'
paq 'tpope/vim-abolish'
paq 'tpope/vim-unimpaired'
paq 'terrortylor/nvim-comment'
-- paq 'tpope/vim-fugitive' -- slow startup

paq 'neovim/nvim-lspconfig' -- Bult-in LSP
-- paq 'ray-x/lsp_signature.nvim' -- LSP Signature support -- replaced by lspsaga
paq 'nvim-lua/lsp_extensions.nvim' -- LSP type inlay hints
paq 'hrsh7th/vim-vsnip' -- LSP snippet
paq 'hrsh7th/nvim-compe' -- Autocomplete + LSP
paq 'glepnir/lspsaga.nvim' -- cute UI LSP
paq 'nvim-lua/lsp-status.nvim' -- for Statusline
paq 'folke/lsp-trouble.nvim'
paq 'simrat39/symbols-outline.nvim' -- replaces Vista
-- https://github.com/kabouzeid/nvim-lspinstall/issues/27
-- require'lspinstall'.setup()
-- paq 'kabouzeid/nvim-lspinstall'


paq 'tpope/vim-dispatch'
paq 'vim-test/vim-test'

-- rust
paq 'simrat39/rust-tools.nvim'
paq 'mhinz/vim-crates'

-- flutter
paq 'akinsho/flutter-tools.nvim'

-- markdown
paq 'npxbr/glow.nvim' -- TODO add keybinds

-- clojure
paq 'Olical/conjure'
paq 'tami5/compe-conjure'
-- paq 'clojure-vim/vim-jack-in' -- closes terminal

-- ui
-- paq 'shaunsingh/moonlight.nvim' -- theme
paq 'folke/tokyonight.nvim' -- theme
paq 'norcalli/nvim-colorizer.lua'
paq 'folke/todo-comments.nvim'
-- paq 'Famiu/feline.nvim' -- no integration to lsp-status
paq 'hoob3rt/lualine.nvim' -- supported by theme
-- paq 'sunjon/shade.nvim' -- dim secondary panes -- issues with telescope TODO switch twlight off
---- https://github.com/kdav5758/TrueZen.nvim
paq 'folke/twilight.nvim' -- hihglight context

-- Initalize systems
vim.cmd 'colorscheme tokyonight'

require'symbols-outline'.setup()
require'nvim_comment'.setup()
require'colorizer'.setup()
require'twilight'.setup()
require'which-key'.setup()
require'lsp-rooter'.setup()
require'todo-comments'.setup {
  signs = false,
}
vim.g['test#strategy'] = "dispatch"
