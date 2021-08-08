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

-- Auto install packer if not exists
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
end

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)

    use {'wbthomason/packer.nvim', opt = true} -- Let packer manage itself

    use {
        'folke/which-key.nvim',
        config = function() require 'plugins.which-key' end
    }

    use {
        'nvim-telescope/telescope.nvim', -- Fuzzy finder
        module = 'telescope',
        cmd = 'Telescope',
        config = function() require 'plugins.telescope' end,
        requires = {
            'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-project.nvim'
        }
    }
    use {
        'ahmedkhalf/lsp-rooter.nvim',
        config = function() require'lsp-rooter'.setup() end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        cmd = {'NvimTreeToggle', 'NvimTreeFindFile', 'NvimTreeRefresh'},
        config = function() require 'plugins.nvim-tree' end
    }
    use {'godlygeek/tabular', cmd = "Tabularize"}
    use 'tpope/vim-surround'
    -- lua surround has less features than viml
    -- use 'blackCauldron7/surround.nvim'
    -- vim.g.surround_mappings_style = "normal"
    -- require"surround".setup{}
    use 'tpope/vim-sleuth'
    use 'tpope/vim-abolish'
    use 'tpope/vim-unimpaired'
    use {
        'terrortylor/nvim-comment',
        cmd = {'CommentToggle', 'CommentOperator'},
        config = function() require'nvim_comment'.setup() end
    }
    -- use 'tpope/vim-fugitive' -- slow startup

    use {
        'neovim/nvim-lspconfig', -- Bult-in LSP
        config = function() require 'plugins.lsp' end,
        requires = {'folke/which-key.nvim', 'nvim-lua/lsp-status.nvim'}
    }
    -- use 'ray-x/lsp_signature.nvim' -- LSP Signature support -- replaced by lspsaga
    use {
        'nvim-lua/lsp_extensions.nvim', -- LSP type inlay hints
        config = function() require 'plugins.inlay-hints' end
    }
    use {
        'glepnir/lspsaga.nvim', -- cute UI LSP
        config = function() require 'plugins.lspsaga' end,
        requires = {'neovim/nvim-lspconfig'}
    }

    use {
        'hrsh7th/nvim-compe', -- Autocomplete + LSP
        config = function() require 'plugins.compe' end,
        requires = {'hrsh7th/nvim-compe'}
    }
    use 'hrsh7th/vim-vsnip' -- LSP snippet

    use {
        'folke/lsp-trouble.nvim',
        cmd = {'Trouble', 'TroubleToggle', 'LspTroubleDocumentToggle'},
        config = function() require'trouble'.setup() end
    }
    use {
        'simrat39/symbols-outline.nvim', -- replaces Vista
        cmd = {'SymbolsOutline', 'SymbolsOutlineOpen'},
        config = function() require'symbols-outline'.setup() end
    }

    -- https://github.com/kabouzeid/nvim-lspinstall/issues/27
    -- require'lspinstall'.setup()
    -- use 'kabouzeid/nvim-lspinstall'

    -- Test
    use {'tpope/vim-dispatch', cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
    use {
        'vim-test/vim-test',
        requires = {'tpop/vim-dispatch'},
        cmd = {'TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit'},
        setup = function() vim.g['test#strategy'] = "dispatch" end
    }

    -- rust
    use {
        'simrat39/rust-tools.nvim',
        requires = {
            'folke/which-key.nvim', 'nvim-lua/lsp-status.nvim',
            'neovim/nvim-lspconfig', 'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim'
        },
        config = function() require 'plugins.rust-tools' end
    }
    use {'mhinz/vim-crates', ft = "toml", cmd = {"CratesUp", "CratesToggle"}}

    -- flutter
    use {
        'akinsho/flutter-tools.nvim',
        ft = {"flutter", "dart"},
        requires = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim'},
        config = function() require 'plugins.flutter-tools' end
    }

    -- markdown
    use {
        'npxbr/glow.nvim', -- TODO add keybinds
        cmd = {'Glow'},
        ft = "markdown"
    }

    -- clojure
    use {'Olical/conjure', ft = {'clojure'}}
    use {'tami5/compe-conjure', after = {'conjure'}}
    -- use 'clojure-vim/vim-jack-in' -- Issues: closes terminal after start

    -- ui
    -- use 'shaunsingh/moonlight.nvim' -- theme
    -- Syntax highlighting
    use {
        'folke/tokyonight.nvim', -- theme
        config = function() vim.cmd 'colorscheme tokyonight' end
    }
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup() end
    }
    use {
        'folke/todo-comments.nvim',
        cmd = {'TodoTrouble', 'TodoQuickFix', 'TodoLocList', 'TodoTelescope'},
        config = function() require'todo-comments'.setup {signs = false} end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require 'plugins.treesitter' end,
        requires = {'p00f/nvim-ts-rainbow'}
    }

    -- use 'Famiu/feline.nvim' -- no integration to lsp-status
    -- use 'hoob3rt/lualine.nvim' -- supported by theme -- no responses
    use {
        'shadmansaleh/lualine.nvim',
        after = 'tokyonight.nvim',
        config = function() require 'plugins.statusline' end,
        requires = {'nvim-lua/lsp-status.nvim'}
    }
    use {
        'nvim-lua/lsp-status.nvim', -- for Statusline
        config = function() require 'plugins.lsp-status' end
    }

    -- use 'sunjon/shade.nvim' -- dim secondary panes -- issues with telescope TODO switch twlight off
    ---- https://github.com/kdav5758/TrueZen.nvim
    use {
        'folke/twilight.nvim', -- hihglight context
        cmd = {"Twilight"},
        config = function() require'twilight'.setup() end
    }
end)
