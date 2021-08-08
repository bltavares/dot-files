local on_attach = require('plugins.lsp.on_attach');
local capabilities = require('plugins.lsp.capabilities').create()
local rust_tools = require('rust-tools')

rust_tools.setup({server = {capabilities = capabilities, on_attach = on_attach}})
