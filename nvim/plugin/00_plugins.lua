local fn = vim.fn

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
-- Crazy good box drawing
--    use "gyim/vim-boxdraw"
-- Better increment/decrement
--    use "monaqa/dial.nvim"
-- https://github.com/nvim-neo-tree/neo-tree.nvim/issues/13
-- https://github.com/petertriho/nvim-scrollbar?utm_source=pocket_mylist
-- Fix Cmd-v on neovide: inoremap <D-v> <C-W>"

-- Auto install packer if not exists
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)

    use 'wbthomason/packer.nvim' -- Let packer manage itself

    use {
        'folke/which-key.nvim',
        config = function() require 'plugins.which-key' end
    }

    use {
        'guns/vim-sexp',
        requires = { 'folke/which-key.nvim' },
        config = function() require 'plugins.vim-sexp' end
    }

    use {
        'nvim-telescope/telescope.nvim', -- Fuzzy finder
        -- module = 'telescope',
        -- cmd = 'Telescope', -- BUG https://github.com/wbthomason/packer.nvim/issues/299
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
    use {'junegunn/vim-easy-align'}
    use {
        'johmsalas/text-case.nvim',
        requires = { 'folke/which-key.nvim', 'nvim-telescope/telescope.nvim' },
        config = function() require'plugins.textcase' end
    }

    use 'tpope/vim-surround'
    -- lua surround has less features than viml
    -- use 'blackCauldron7/surround.nvim'
    -- vim.g.surround_mappings_style = "normal"
    -- require"surround".setup{}
    use 'tpope/vim-sleuth' -- use correct expandtab/shiftwidth
    use 'tpope/vim-abolish' -- smart search/replace
    use 'tpope/vim-unimpaired' -- better % pairing
    use {
        'terrortylor/nvim-comment',
        cmd = {'CommentToggle', 'CommentOperator'},
        config = function() require'nvim_comment'.setup() end
    }
    -- use 'tpope/vim-fugitive' -- slow startup

    use {
        'neovim/nvim-lspconfig', -- Bult-in LSP
        config = function() require 'plugins.lsp' end,
        requires = {
            'folke/which-key.nvim',
            'nvim-lua/lsp-status.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },
    }
    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = function() require 'plugins.null-ls' end,
        requires = {'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig'},
    }
    -- use 'ray-x/lsp_signature.nvim' -- LSP Signature support -- replaced by lspsaga
    use {
        'nvim-lua/lsp_extensions.nvim', -- LSP type inlay hints
        config = function() require 'plugins.inlay-hints' end
    }
    use {
        'glepnir/lspsaga.nvim', -- cute UI LSP
        branch = 'main',
        config = function() require 'plugins.lspsaga' end,
        requires = {'neovim/nvim-lspconfig'}
    }

    -- TODO: migrate to nvim-comp
    use {
        'hrsh7th/nvim-cmp', -- Autocomplete + LSP
        config = function() require 'plugins.cmp' end,
        requires = {
            'hrsh7th/vim-vsnip',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        }
    }

    use {
        'folke/lsp-trouble.nvim',
        cmd = {'Trouble', 'TroubleToggle'},
        config = function() require'trouble'.setup({ icons = false }) end
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
    -- TODO validate cmp-conjure loading order
    use {
        'PaterJason/cmp-conjure',
        requires = {'Olical/conjure', 'hrsh7th/nvim-cmp'},
        ft = {'clojure'}
    }
    use {
      'clojure-vim/vim-jack-in',
      requires = {'tpope/vim-dispatch', 'radenling/vim-dispatch-neovim'},
      ft = {'clojure'}
    }

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
    use {
        'nvim-lualine/lualine.nvim',
        after = 'tokyonight.nvim',
        config = function() require 'plugins.statusline' end,
        requires = {'nvim-lua/lsp-status.nvim', "nvim-treesitter/nvim-treesitter"}
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

    use {
        'antoinemadec/FixCursorHold.nvim',
        setup = function()
            print('There')
            vim.g.cursorhold_updatetime = 100
        end,
    }
end)
