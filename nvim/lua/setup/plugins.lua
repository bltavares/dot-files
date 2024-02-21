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
        'folke/which-key.nvim', -- Keybindings helper
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function() require 'config.which-key' end
    },

    {
        'guns/vim-sexp', -- TODO lua version
        dependencies = { 'folke/which-key.nvim' },
        config = function() require 'config.vim-sexp' end
    },

    {
        'nvim-telescope/telescope.nvim', -- Fuzzy finder
        cmd = 'Telescope',
        config = function() require 'config.telescope' end,
        dependencies = {
            'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-project.nvim'
        },
    },
    {
        'ahmedkhalf/lsp-rooter.nvim',
        config = function() require 'lsp-rooter'.setup() end
    },
    {
        "projekt0n/circles.nvim", -- replace web-dev-icons with circles
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require("circles").setup() end
    },

    -- Files
    {
        'nvim-tree/nvim-tree.lua',
        cmd = { 'NvimTreeToggle', 'NvimTreeFindFile', 'NvimTreeRefresh' },
        config = function() require 'config.nvim-tree' end
    },

    -- Text manupulation
    { 'godlygeek/tabular',      cmd = "Tabularize" }, -- TODO lua version
    { 'junegunn/vim-easy-align' },                    -- TODO: lazy loading and lua version
    {
        'johmsalas/text-case.nvim',                   -- change text cases
        dependencies = { 'folke/which-key.nvim', 'nvim-telescope/telescope.nvim' },
        config = function() require 'config.textcase' end
    },
    {
        'Wansmer/treesj', -- Semantic split/join
        cmd = { "TSJToggle", "TSJSplit", "TSJJoin", },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        opts = {
            use_default_keymaps = false,
        },
    },
    -- TODO search for lua versions
    'tpope/vim-surround',
    'tpope/vim-sleuth',     -- use correct expandtab/shiftwidth
    'tpope/vim-abolish',    -- smart search/replace
    'tpope/vim-unimpaired', -- better % pairing
    {
        'terrortylor/nvim-comment',
        cmd = { 'CommentToggle', 'CommentOperator' },
        config = function() require 'config.nvim-comment' end,
        dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    },
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        opts = { enable_autocmd = false },
    },
    {
        'RRethy/vim-illuminate',
        lazy = true,
        enabled = true,
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        cmd = { "IlluminatePause", "IlluminateResume", "IlluminateToggle", "IlluminatePauseBuf", "IlluminateResumeBuf", "IlluminateToggleBuf" },
        event = { 'CursorMoved', 'InsertLeave' },
        config = function()
            require 'illuminate'.configure {
                filetypes_denylist = {
                    'neotree',
                    'neo-tree',
                    'Telescope',
                    'telescope',
                }
            }
        end
    },
    -- 'tpope/vim-fugitive' -- slow startup

    -- LSP
    {
        'neovim/nvim-lspconfig', -- Bult-in LSP
        config = function() require 'config.lsp' end,
        dependencies = {
            'folke/which-key.nvim',
            'j-hui/fidget.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'VidocqH/lsp-lens.nvim',
        },
    },
    {
        'nvimtools/none-ls.nvim', -- LSP for non-lsp tools
        config = function() require 'config.null-ls' end,
        dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
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
        "j-hui/fidget.nvim", -- LSP status
        event = { "VeryLazy" },
        opts = {},
    },
    {
        'VidocqH/lsp-lens.nvim', -- lsp fn references virtualtext
        cmd = { "LspLensToggle", "LspLensOn", "LspLensOff" },
        event = { "VeryLazy" },
        config = function() require 'config.lsp-lens' end
    },

    -- completion
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

    -- Project navigation
    {
        'folke/lsp-trouble.nvim',
        cmd = { 'Trouble', 'TroubleToggle' },
        config = function() require 'trouble'.setup({ icons = false }) end
    },

    {
        "hedyhli/outline.nvim", -- LSP based buffer object/fn outlines
        lazy = true,
        cmd = { "Outline", "OutlineOpen" },
        opts = {}
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
        cmd = { "Neotest" },
        config = function() require 'config.neotest' end,
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
            'folke/which-key.nvim',
            'neovim/nvim-lspconfig', 'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim'
        },
        init = function() require 'config.rustaceanvim' end,
    },
    {
        'saecki/crates.nvim', -- version finder helper on Cargo.toml
        event = { "BufRead Cargo.toml" },
        config = function() require 'config.crates' end,
        requires = { 'hrsh7th/nvim-cmp', },
    },

    -- flutter
    {
        'akinsho/flutter-tools.nvim',
        ft = { "flutter", "dart" },
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
        config = function() require 'config.flutter-tools' end
    },

    -- markdown
    -- TODO add keybinds
    {
        'npxbr/glow.nvim', -- Preview .md rendering
        cmd = { 'Glow' },
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
        'clojure-vim/vim-jack-in', -- allow dispatching nrepl from vim
        dependencies = { 'tpope/vim-dispatch', 'radenling/vim-dispatch-neovim' },
        ft = { 'clojure' },
    },
    { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } },

    -- ui
    {
        'folke/tokyonight.nvim', -- theme
        config = function() vim.cmd 'colorscheme tokyonight' end
    },
    {
        'norcalli/nvim-colorizer.lua', -- colorize #abc123 colors
        config = function() require 'colorizer'.setup() end
    },
    {
        'folke/todo-comments.nvim', -- Colorize and find things to do
        cmd = { 'TodoTrouble', 'TodoQuickFix', 'TodoLocList', 'TodoTelescope' },
        config = function() require 'todo-comments'.setup { signs = false } end
    },
    {
        'nvim-treesitter/nvim-treesitter', -- Syntax highlighting and query engine
        build = ':TSUpdate',
        config = function() require 'config.treesitter' end,
        dependencies = { 'HiPhish/rainbow-delimiters.nvim' },
    },

    {
        'nvim-lualine/lualine.nvim',
        config = function() require 'config.statusline' end,
        dependencies = { "nvim-treesitter/nvim-treesitter", "tokyonight.nvim" },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    {
        'folke/twilight.nvim', -- hihglight TS context
        cmd = { "Twilight" },
        config = function() require 'twilight'.setup() end
    },
    -- BUG https://github.com/pocco81/true-zen.nvim/issues/125
    -- {'pocco81/true-zen.nvim',
    --     cmd={"TZAtaraxis", "TZNarrow"},
    --     opts = {}
    -- },
    {
        'antoinemadec/FixCursorHold.nvim', -- Fixes for CursorHold events. Allegedly not needed anymore. But stil useful (2024-02)
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
