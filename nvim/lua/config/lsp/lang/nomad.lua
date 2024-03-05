local on_attach = require("config.lsp.on_attach")
local capabilities = require("config.lsp.capabilities").create()

require("lspconfig").nomad_lsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
