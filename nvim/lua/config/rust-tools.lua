local on_attach = require('config.lsp.on_attach');
local capabilities = require('config.lsp.capabilities').create()
local rust_tools = require('rust-tools')

rust_tools.setup({server = {capabilities = capabilities, on_attach = on_attach}})
