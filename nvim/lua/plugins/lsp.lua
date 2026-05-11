return {
  {
    "neovim/nvim-lspconfig", -- Bult-in LSP configs
    config = function()
      local capabilities = require("config.lsp.capabilities").create()
      local on_attach = require("config.lsp.on_attach")

      vim.lsp.config("*", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.diagnostic.config({
        virtual_text = { prefix = " » " },
        underline = true,
        signs = true,
      })

      -- Does not work, client is not fully attached when event triggers
      -- vim.api.nvim_create_autocmd('LspAttach', {
      --   callback = function(ev)
      --     on_attach(ev.data.client_id, ev.buf)
      --   end
      -- })

      vim.lsp.enable({
        "clojure_lsp",
        "gleam",
        "gopls",
        "lua_ls",
        "nomad_lsp",
        "terraformls",
        "tombi",
      })

      -- incomplete lsp
      -- require 'config.lsp.lang.nomad'
    end,
    dependencies = {
      "folke/which-key.nvim",
      "j-hui/fidget.nvim",
      "saghen/blink.cmp",
      "VidocqH/lsp-lens.nvim",
    },
  },
  {
    "nvimtools/none-ls.nvim", -- LSP for non-lsp tools
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      "gbprod/none-ls-shellcheck.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      local on_attach = require("config.lsp.on_attach")
      local capabilities = require("config.lsp.capabilities").create()

      null_ls.register(require("none-ls-shellcheck.diagnostics"))
      null_ls.register(require("none-ls-shellcheck.code_actions"))

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.stylua,
        },
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },

  -- ui
  {
    "j-hui/fidget.nvim", -- LSP progress status
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
    opts = {
      sections = {
        git_authors = function(latest_author, count)
          return "▸ " .. latest_author .. (count - 1 == 0 and "" or (" + " .. count - 1))
        end,
      },
    },
  },

  {
    "nvimdev/lspsaga.nvim", -- cute UI LSP
    opts = {
      -- diagnostic_header_icon = '»',
      -- error, warn, info, hint
      symbol_in_winbar = { separator = "»" },
      diagnostic_header = { "•e", "•w", "•i", "•h" },
      code_action_icon = "?",
      code_action_lightbulb = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
      },
      code_action_keys = { quit = "<esc>", exec = "<CR>" },
      finder_icons = {
        def = "•d",
        ref = "•r",
        link = "•l",
      },
      finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        quit = "<esc>",
        scroll_down = "<C-n>",
        scroll_up = "<C-p>",
      },
      ui = {
        -- Reset the icons as I dont like them
        kind = {
          File = "",
          Module = "",
          Namespace = "",
          Package = "",
          Class = "",
          Method = "",
          Property = "",
          Field = "",
          Constructor = "",
          Enum = "",
          Interface = "",
          Function = "",
          Variable = "",
          Constant = "",
          String = "",
          Number = "",
          Boolean = "",
          Array = "",
          Object = "",
          Key = "",
          Null = "",
          EnumMember = "",
          Struct = "",
          Event = "",
          Operator = "",
          TypeParameter = "",
          TypeAlias = "",
          Parameter = "",
          StaticMethod = "",
          Macro = "",
          Text = "",
          Snippet = "",
          Folder = "",
          Unit = "",
          Value = "",
        },
      },
      -- behaviour
      code_action = {
        extend_gitsigns = true,
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
      "lewis6991/gitsigns.nvim",
    },
  },
}
