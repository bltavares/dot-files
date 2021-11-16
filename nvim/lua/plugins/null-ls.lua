local null_ls = require("null-ls")

null_ls.config({
    sources = {
        null_ls.builtins.formatting.shfmt,
        null_ls:builtins.diagnostics.shellcheck,
    }
})

local on_attach = require 'plugins.lsp.on_attach';
local capabilities = require'plugins.lsp.capabilities'.create()

require'lspconfig'['null-ls'].setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
