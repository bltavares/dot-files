local null_ls = require("null-ls")

local on_attach = require 'plugins.lsp.on_attach';
local capabilities = require'plugins.lsp.capabilities'.create()

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.diagnostics.shellcheck,
    },
    on_attach = on_attach,
    capabilities = capabilities,
})
