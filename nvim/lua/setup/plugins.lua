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

require("lazy").setup({
  rocks = {
    enabled = false,
  },
  spec = {
    {
      "folke/which-key.nvim", -- Keybindings helper
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      config = function()
        require("config.which-key")
      end,
    },

    {
      "guns/vim-sexp", -- TODO lua version
      dependencies = { "folke/which-key.nvim" },
      config = function()
        require("config.vim-sexp")
      end,
    },
    {
      "DrKJeff16/project.nvim",
      opts = {
        snacks = { enabled = true },
      },
    },
    {
      "projekt0n/circles.nvim", -- replace web-dev-icons with circles
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {},
    },

    -- Files
    {
      "nvim-tree/nvim-tree.lua",
      cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeRefresh" },
      config = function()
        require("config.nvim-tree")
      end,
    },

    -- Text manupulation
    { "godlygeek/tabular", cmd = "Tabularize" }, -- TODO lua version
    { "junegunn/vim-easy-align" }, -- TODO: lazy loading and lua version
    {
      "johmsalas/text-case.nvim", -- change text cases TODO replace with vim-abolish?
      setup = {}, -- TODO check for snacks integration in the future/for-
    },
    {
      "Wansmer/treesj", -- Semantic split/join
      cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      opts = {
        use_default_keymaps = false,
      },
    },
    -- TODO search for lua versions
    "tpope/vim-surround",
    "tpope/vim-sleuth",     -- use correct expandtab/shiftwidth
    "tpope/vim-abolish",    -- smart search/replace
    "tpope/vim-unimpaired", -- better % pairing
    {
      "terrortylor/nvim-comment",
      cmd = { "CommentToggle" },
      config = function()
        require("config.nvim-comment")
      end,
      dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
    {
      "JoosepAlviste/nvim-ts-context-commentstring", -- changes comment string based on location for embedded langs in same file
      opts = { enable_autocmd = false },
    },
    -- 'tpope/vim-fugitive' -- slow startup

    -- LSP
    {
      "neovim/nvim-lspconfig", -- Bult-in LSP
      config = function()
        require("config.lsp")
      end,
      dependencies = {
        "folke/which-key.nvim",
        "j-hui/fidget.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "VidocqH/lsp-lens.nvim",
      },
    },
    {
      "nvimtools/none-ls.nvim", -- LSP for non-lsp tools
      config = function()
        require("config.null-ls")
      end,
      dependencies = {
        "nvim-lua/plenary.nvim",
        "neovim/nvim-lspconfig",
        "gbprod/none-ls-shellcheck.nvim",
      },
    },
    {
      "nvimdev/lspsaga.nvim", -- cute UI LSP
      config = function()
        require("config.lspsaga")
      end,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-treesitter/nvim-treesitter",
        "lewis6991/gitsigns.nvim",
      },
    },
    {
      "j-hui/fidget.nvim", -- LSP status
      event = { "VeryLazy" },
      opts = {
        notification = {
          window = {
            avoid = {
              "NvimTree",
              "neotest-summary",
            },
          },
        },
      },
    },
    {
      "VidocqH/lsp-lens.nvim", -- lsp fn references virtualtext
      cmd = { "LspLensToggle", "LspLensOn", "LspLensOff" },
      event = { "VeryLazy" },
      config = function()
        require("config.lsp-lens")
      end,
    },

    -- completion
    {
      "hrsh7th/nvim-cmp", -- Autocomplete + LSP
      config = function()
        require("config.cmp")
      end,
      dependencies = {
        "hrsh7th/vim-vsnip",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "PaterJason/cmp-conjure",
      },
    },

    -- Project navigation
    {
      "folke/lsp-trouble.nvim",
      cmd = { "Trouble", "TroubleToggle" },
      opts = {
        icons = {},
      },
    },

    {
      "hedyhli/outline.nvim", -- LSP based buffer object/fn outlines - alternative to `gO`
      lazy = true,
      cmd = { "Outline", "OutlineOpen" },
      opts = {},
    },
    {
      "petertriho/nvim-scrollbar", -- UI decoration minimap
      opts = {},
    },

    -- Test
    {
      "nvim-neotest/neotest",
      dependencies = {
        -- deps
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        {
          "antoinemadec/FixCursorHold.nvim", -- https://github.com/antoinemadec/FixCursorHold.nvim/issues/13
          init = function()
            vim.g.cursorhold_updatetime = 100
          end,
        },
        "nvim-treesitter/nvim-treesitter",
        -- adatpers
        "sidlatau/neotest-dart",
        "mrcjkb/rustaceanvim",
        "nvim-neotest/neotest-go",
      },
      cmd = { "Neotest" },
      config = function()
        require("config.neotest")
      end,
    },

    -- rust
    {
      "mrcjkb/rustaceanvim",
      -- version = '^4', -- Recommended
      ft = { "rust" },
      dependencies = {
        "folke/which-key.nvim",
        "neovim/nvim-lspconfig",
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
      },
      init = function()
        require("config.rustaceanvim")
      end,
    },
    {
      "saecki/crates.nvim", -- version finder helper on Cargo.toml
      event = { "BufRead Cargo.toml" },
      opts = {
        lsp = {
          enabled = true,
          actions = true,
          completion = true,
          hover = true,
        },
      },
    },

    -- flutter
    {
      -- waiting for https://github.com/nvim-flutter/flutter-tools.nvim/pull/512
      "akinsho/flutter-tools.nvim",
      ft = { "flutter", "dart" },
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("config.flutter-tools")
      end,
    },

    -- markdown
    -- TODO add keybinds
    {
      "npxbr/glow.nvim", -- Preview .md rendering
      cmd = { "Glow" },
      ft = "markdown",
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
        vim.g["conjure#filetypes"] = { "clojure" }
        vim.g["conjure#client#clojure#nrepl#mapping#refresh_all"] = "rA"
      end,
    },
    {
      "clojure-vim/vim-jack-in", -- allow dispatching nrepl from vim
      dependencies = { "tpope/vim-dispatch", "radenling/vim-dispatch-neovim" },
      ft = { "clojure" },
    },
    { "tpope/vim-dispatch", cmd = { "Dispatch", "Make", "Focus", "Start" } },

    -- ui
    {
      "folke/tokyonight.nvim", -- theme
      config = function()
        vim.cmd("colorscheme tokyonight")
      end,
    },
    {
      "brenoprata10/nvim-highlight-colors", -- colorize #abc123 colors
      opts = {
        render = "virtual",
        virtual_symbol = "■",
      },
    },
    {
      "folke/todo-comments.nvim", -- Colorize and find things to do
      cmd = { "TodoTrouble", "TodoQuickFix", "TodoLocList" },
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
        signs = false,
      },
    },
    {
      "nvim-treesitter/nvim-treesitter", -- Syntax highlighting and query engine (archived as of 2026-04)
      build = ":TSUpdate",
      config = function()
        require("config.treesitter")
      end,
      dependencies = { "HiPhish/rainbow-delimiters.nvim" },
    },

    {
      "code-biscuits/nvim-biscuits", -- scope context virtual text
      opts = {
        cursor_line_only = true,
      },
      dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    {
      "nvim-lualine/lualine.nvim",
      config = function()
        require("config.statusline")
      end,
      dependencies = { "nvim-treesitter/nvim-treesitter", "tokyonight.nvim" },
    },
    {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      opts = {
        bigfile = {},
        dim = {},
        indent = {
          animate = {
            enabled = false,
          },
        },
        input = {},
        notifier = {},
        picker = {},
        scope = {},
        toggle = {},
        words = {},
        zen = {},
      },
      init = function()
        require("config.snacks")
      end,
    },
    {
      "linrongbin16/gitlinker.nvim",
      cmd = { "GitLink" },
      opts = {},
    },
    {
      "lewis6991/gitsigns.nvim", -- TODO keymaps
      cmd = { "Gitsigns" },
      opts = {},
      dependencies = { "folke/lsp-trouble.nvim" },
    },

    -- Devcontainers
    {
      "esensar/nvim-dev-container",
      cmd = { "DevcontainerStart", "DevcontainerStop" },
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      config = function()
        require("devcontainer").setup({
          container_runtime = "docker",
          attach_mounts = {
            always = true,
          },
        })
      end,
    },
  },
})
