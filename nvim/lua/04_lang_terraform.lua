local on_attach = require 'utils.lsp.on_attach';
local capabilities = require'utils.lsp.capabilities'.create()

-- TODO syntax highlight with treesitter
require'lspconfig'.terraformls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
