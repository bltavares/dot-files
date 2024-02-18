local on_attach = require('config.lsp.on_attach');
local capabilities = require('config.lsp.capabilities').create()

vim.g.rustaceanvim = {
    server = {
        on_attach = on_attach,
        capabilities = capabilities,
    },
}
