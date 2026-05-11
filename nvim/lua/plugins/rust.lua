return {
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
    config = function()
      local capabilities = require("config.lsp.capabilities").create()
      local on_attach = require("config.lsp.on_attach")
      local wk = require("which-key")
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            wk.add({
              { buffer = bufnr, remap = false },
              { "<localleader>e", group = "eval" },
              { "<localleader>eR", "<Cmd>RustLsp! runnables<CR>", desc = "last" },
              { "<localleader>er", "<Cmd>RustLsp runnables<CR>", desc = "run" },
              { "<localleader>ed", "<Cmd>RustLsp debug<CR>", desc = "debug" },
              { "<localleader>eD", "<Cmd>RustLsp debuggables<CR>", desc = "debuggables" },
              { "J", "<Cmd>RustLsp joinLines<CR>", desc = "join" },
            })
          end,
          capabilities = capabilities,
        },
      }
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
}
