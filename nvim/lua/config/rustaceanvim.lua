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
      })
    end,
    capabilities = capabilities,
  },
}
