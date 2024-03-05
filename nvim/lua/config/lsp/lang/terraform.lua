local on_attach = require("config.lsp.on_attach")
local capabilities = require("config.lsp.capabilities").create()

-- TODO syntax highlight with treesitter
require("lspconfig").terraformls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
