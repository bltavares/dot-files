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
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function() require 'config.which-key' end
    },

    {
        'guns/vim-sexp',
        dependencies = { 'folke/which-key.nvim' },
        config = function() require 'config.vim-sexp' end
    },

    {
        'nvim-telescope/telescope.nvim', -- Fuzzy finder
        module = 'telescope',
        cmd = 'Telescope',
        config = function() require 'config.telescope' end,
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
        config = function() require 'config.nvim-tree' end
    },
    {'godlygeek/tabular', cmd = "Tabularize"},
    {'junegunn/vim-easy-align'},
    {
        'johmsalas/text-case.nvim',
        dependencies = { 'folke/which-key.nvim', 'nvim-telescope/telescope.nvim' },
        config = function() require'config.textcase' end
    },

    -- TODO search for lua versions
    'tpope/vim-surround',
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
        config = function() require 'config.lsp' end,
        dependencies = {
            'folke/which-key.nvim',
            'nvim-lua/lsp-status.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },
    },
    {
        'nvimtools/none-ls.nvim',
        config = function() require 'config.null-ls' end,
        dependencies = {'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig'},
    },
    {
        'nvimdev/lspsaga.nvim', -- cute UI LSP
        config = function() require 'config.lspsaga' end,
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- fuck this shit ARRRRG
            'nvim-treesitter/nvim-treesitter',
        }
    },

    {
        'hrsh7th/nvim-cmp', -- Autocomplete + LSP
        config = function() require 'config.cmp' end,
        dependencies = {
            'hrsh7th/vim-vsnip',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            "PaterJason/cmp-conjure",
        },
    },

    {
        'folke/lsp-trouble.nvim',
        cmd = {'Trouble', 'TroubleToggle'},
        config = function() require'trouble'.setup({ icons = false }) end
    },

    {
        "hedyhli/outline.nvim",
        lazy = true,
        cmd = { "Outline", "OutlineOpen" },
        opts = { }
    },

    -- Test
    -- PR https://github.com/nvim-neotest/neotest/pull/368
    { 
        "bltavares/neotest",
        branch = "wip",
        dependencies = {
            -- deps
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- adatpers
            'sidlatau/neotest-dart',
            'bltavares/rustaceanvim',
            "nvim-neotest/neotest-go",
        },
        cmd = {"Neotest"},
        config = function() require'config.neotest' end,
    },

    -- rust

    -- PR
    -- https://github.com/mrcjkb/rustaceanvim/pull/245
    -- https://github.com/mrcjkb/rustaceanvim/pull/246
    -- https://github.com/mrcjkb/rustaceanvim/pull/247
    {
        'bltavares/rustaceanvim',
        branch = "wip",
        -- version = '^4', -- Recommended
        ft = { 'rust' },
        dependencies = {
            'folke/which-key.nvim', 'nvim-lua/lsp-status.nvim',
            'neovim/nvim-lspconfig', 'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim'
        },
        init = function() require 'config.rustaceanvim' end,
    },
    {
        'saecki/crates.nvim',
        event = { "BufRead Cargo.toml" },
        config = function() require'config.crates' end,
        requires = { 'hrsh7th/nvim-cmp', },
    },

    -- flutter
    {
        'akinsho/flutter-tools.nvim',
        ft = {"flutter", "dart"},
        dependencies = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim'},
        config = function() require 'config.flutter-tools' end
    },

    -- markdown
    {
        'npxbr/glow.nvim', -- TODO add keybinds
        cmd = {'Glow'},
        ft = "markdown"
    },

    -- clojure
    {
        "Olical/conjure",
        dependencies = { "PaterJason/cmp-conjure" },
        ft = { "clojure" },
        config = function()
            require("conjure.main").main()
            require("conjure.mapping")["on-filetype"]()
        end,
        init = function()
            vim.g['conjure#filetypes'] = { "clojure" }
            vim.g['conjure#client#clojure#nrepl#mapping#refresh_all'] = "rA"
        end,
    },
    {
      'clojure-vim/vim-jack-in',
      dependencies = {'tpope/vim-dispatch', 'radenling/vim-dispatch-neovim'},
      ft = {'clojure'},
    },
    {'tpope/vim-dispatch', cmd = {'Dispatch', 'Make', 'Focus', 'Start'}},

    -- ui
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
        config = function() require 'config.treesitter' end,
        dependencies = {'p00f/nvim-ts-rainbow'},
    },

    {
        'nvim-lualine/lualine.nvim',
        config = function() require 'config.statusline' end,
        dependencies = {'nvim-lua/lsp-status.nvim', "nvim-treesitter/nvim-treesitter", "tokyonight.nvim"},
    },
    {
        'nvim-lua/lsp-status.nvim', -- for Statusline
        config = function() require 'config.lsp-status' end
    },

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
    },


    -- Devcontainers
    {
        'esensar/nvim-dev-container',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('devcontainer').setup {
                container_runtime = "docker",
                attach_mounts = {
                    always = true
                },
            }
        end
    }
})
