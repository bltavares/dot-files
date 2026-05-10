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
