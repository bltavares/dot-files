local on_attach = require 'utils.lsp.on_attach';
local capabilities = require'utils.lsp.capabilities'.create()

-- TODO https://github.com/liquidz/vim-iced
-- https://github.com/Olical/conjure
-- https://github.com/guns/vim-sexp
require'lspconfig'.clojure_lsp.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

