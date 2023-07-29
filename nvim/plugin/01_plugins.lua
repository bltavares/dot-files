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
--    "gyim/vim-boxdraw"
-- Better increment/decrement
--    "monaqa/dial.nvim"
-- https://github.com/nvim-neo-tree/neo-tree.nvim/issues/13
-- https://github.com/petertriho/nvim-scrollbar?utm_source=pocket_mylist
-- Fix Cmd-v on neovide: inoremap <D-v> <C-W>"
-- treesitter semantic join
-- https://github.com/Wansmer/treesj
--
-- Replace null-ls?
-- https://github.com/mfussenegger/nvim-lint
-- https://github.com/mhartington/formatter.nvim (?maybe)

-- Auto install lazy if not exists
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'folke/which-key.nvim',
        config = function() require 'plugins.which-key' end
    },

    {
        'guns/vim-sexp',
        dependencies = { 'folke/which-key.nvim' },
        config = function() require 'plugins.vim-sexp' end
    },

    {
        'nvim-telescope/telescope.nvim', -- Fuzzy finder
        -- module = 'telescope',
        -- cmd = 'Telescope', -- BUG https://github.com/wbthomason/packer.nvim/issues/299
        config = function() require 'plugins.telescope' end,
        dependencies = {
            'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-project.nvim'
        },
    },
    {
        'ahmedkhalf/lsp-rooter.nvim',
        config = function() require'lsp-rooter'.setup() end
    },
    {
        "projekt0n/circles.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function() require("circles").setup() end
    },
    {
        'kyazdani42/nvim-tree.lua',
        cmd = {'NvimTreeToggle', 'NvimTreeFindFile', 'NvimTreeRefresh'},
        config = function() require 'plugins.nvim-tree' end
    },
    {'godlygeek/tabular', cmd = "Tabularize"},
    {'junegunn/vim-easy-align'},
    {
        'johmsalas/text-case.nvim',
        dependencies = { 'folke/which-key.nvim', 'nvim-telescope/telescope.nvim' },
        config = function() require'plugins.textcase' end
    },

    'tpope/vim-surround',
    -- lua surround has less features than viml
    -- 'blackCauldron7/surround.nvim'
    -- vim.g.surround_mappings_style = "normal"
    -- require"surround".setup{},
    'tpope/vim-sleuth', -- use correct expandtab/shiftwidth
    'tpope/vim-abolish', -- smart search/replace
    'tpope/vim-unimpaired', -- better % pairing
    {
        'terrortylor/nvim-comment',
        cmd = {'CommentToggle', 'CommentOperator'},
        config = function() require'nvim_comment'.setup() end
    },
    -- 'tpope/vim-fugitive' -- slow startup

    {
        'neovim/nvim-lspconfig', -- Bult-in LSP
        config = function() require 'plugins.lsp' end,
        dependencies = {
            'folke/which-key.nvim',
            'nvim-lua/lsp-status.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        config = function() require 'plugins.null-ls' end,
        dependencies = {'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig'},
    },
    -- 'ray-x/lsp_signature.nvim' -- LSP Signature support -- replaced by lspsaga
    {
        'nvim-lua/lsp_extensions.nvim', -- LSP type inlay hints
        config = function() require 'plugins.inlay-hints' end
    },
    {
        'glepnir/lspsaga.nvim', -- cute UI LSP
        branch = 'main',
        config = function() require 'plugins.lspsaga' end,
        dependencies = {
            'neovim/nvim-lspconfig',
            'nvim-tree/nvim-web-devicons', -- fuck this shit ARRRRG
            --Please make sure you install markdown and markdown_inline parser
            'nvim-treesitter/nvim-treesitter',
        }
    }

    -- TODO: migrate to nvim-comp
    {
        'hrsh7th/nvim-cmp', -- Autocomplete + LSP
        config = function() require 'plugins.cmp' end,
        dependencies = {
            'hrsh7th/vim-vsnip',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        },
    },

    {
        'folke/lsp-trouble.nvim',
        cmd = {'Trouble', 'TroubleToggle'},
        config = function() require'trouble'.setup({ icons = false }) end
    },
    {
        'simrat39/symbols-outline.nvim', -- replaces Vista
        cmd = {'SymbolsOutline', 'SymbolsOutlineOpen'},
        config = function() require'symbols-outline'.setup() end
    },

    -- https://github.com/kabouzeid/nvim-lspinstall/issues/27
    -- require'lspinstall'.setup()
    -- 'kabouzeid/nvim-lspinstall'

    -- Test
    {'tpope/vim-dispatch', cmd = {'Dispatch', 'Make', 'Focus', 'Start'}},
    {
        'vim-test/vim-test',
        dependencies = {'tpope/vim-dispatch'},
        cmd = {'TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit'},
        init = function() vim.g['test#strategy'] = "dispatch" end
    },

    -- rust
    {
        'simrat39/rust-tools.nvim',
        dependencies = {
            'folke/which-key.nvim', 'nvim-lua/lsp-status.nvim',
            'neovim/nvim-lspconfig', 'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim'
        },
        config = function() require 'plugins.rust-tools' end
    },
    {'mhinz/vim-crates', ft = "toml", cmd = {"CratesUp", "CratesToggle"}},

    -- flutter
    {
        'akinsho/flutter-tools.nvim',
        ft = {"flutter", "dart"},
        dependencies = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim'},
        config = function() require 'plugins.flutter-tools' end
    },

    -- markdown
    {
        'npxbr/glow.nvim', -- TODO add keybinds
        cmd = {'Glow'},
        ft = "markdown"
    },

    -- clojure
    -- TODO validate cmp-conjure loading order
    {
        'PaterJason/cmp-conjure',
        dependencies = {'Olical/conjure', 'hrsh7th/nvim-cmp'},
        ft = {'clojure'},
    },
    {
      'clojure-vim/vim-jack-in',
      dependencies = {'tpope/vim-dispatch', 'radenling/vim-dispatch-neovim'},
      ft = {'clojure'},
    },

    -- ui
    -- 'shaunsingh/moonlight.nvim' -- theme
    -- Syntax highlighting
    {
        'folke/tokyonight.nvim', -- theme
        config = function() vim.cmd 'colorscheme tokyonight' end
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup() end
    },
    {
        'folke/todo-comments.nvim',
        cmd = {'TodoTrouble', 'TodoQuickFix', 'TodoLocList', 'TodoTelescope'},
        config = function() require'todo-comments'.setup {signs = false} end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function() require 'plugins.treesitter' end,
        dependencies = {'p00f/nvim-ts-rainbow'},
    },

    -- 'Famiu/feline.nvim' -- no integration to lsp-status
    {
        'nvim-lualine/lualine.nvim',
        config = function() require 'plugins.statusline' end,
        dependencies = {'nvim-lua/lsp-status.nvim', "nvim-treesitter/nvim-treesitter", "tokyonight.nvim"},
    },
    {
        'nvim-lua/lsp-status.nvim', -- for Statusline
        config = function() require 'plugins.lsp-status' end
    },

    -- 'sunjon/shade.nvim' -- dim secondary panes -- issues with telescope TODO switch twlight off
    ---- https://github.com/kdav5758/TrueZen.nvim
    {
        'folke/twilight.nvim', -- hihglight context
        cmd = {"Twilight"},
        config = function() require'twilight'.setup() end
    },

    {
        'antoinemadec/FixCursorHold.nvim',
        init = function()
            vim.g.cursorhold_updatetime = 100
        end,
    },

    -- Autocompletion AI
     {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                --- use cmp instead
                -- suggestion = { enabled = false },
                -- panel = { enabled = false },
            })
        end,
    }

    -- use {
    --     "zbirenbaum/copilot-cmp",
    --     after = { "copilot.lua" },
    --     config = function ()
    --         require("copilot_cmp").setup()
    --     end
    -- }
    --

})
