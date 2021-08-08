local on_attach = require 'plugins.lsp.on_attach';
local capabilities = require'plugins.lsp.capabilities'.create()

-- TODO syntax highlight with treesitter
require'lspconfig'.terraformls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
