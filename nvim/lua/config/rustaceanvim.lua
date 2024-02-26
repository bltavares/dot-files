local capabilities = require('config.lsp.capabilities').create()
local on_attach = require 'config.lsp.on_attach';
local wk = require('which-key')

vim.g.rustaceanvim = {
    server = {
        on_attach = function(client, bufnr)
            require 'config.lsp.on_attach' (client, bufnr);
            on_attach(client, bufnr);
            local keymap = {
                e = {
                    name = "+eval",
                    r = { "<Cmd>RustLsp runnables<CR>", "run" },
                    R = { "<Cmd>RustLsp! runnables<CR>", "last" },
                }
            }

            wk.register(keymap, {
                prefix = '<localleader>',
                silent = true,
                noremap = true,
                mode = 'n',
                buffer = bufnr
            })
        end,
        capabilities = capabilities,
    },
}
