
local on_attach = function(client, bufnr)
    require 'plugins.lsp.on_attach'(client, bufnr);
    local wk = require('which-key')
    local keymap = {
        c = {"<cmd>lua require('telescope').extensions.flutter.commands()<CR>", "commands"},
        r = {
            r = {"<cmd>FlutterReload<CR>", "reload"},
            R = {"<cmd>FlutterRestart<CR>", "restart"},
            D = {
                name = "+devices",
                r = {"<cmd>FlutterRun<CR>", "run"},
                d = {"<cmd>FlutterDevices<CR>", "devices"},
                e = {"<cmd>FlutterEmulators<CR>", "emulators"},
                t = {"<cmd>FlutterDevTools<CR>", "dev tools"},
                q = {"<cmd>FlutterQuite<CR>", "quit"}
            },
            O = {"<cmd>FlutterOutline<CR>", "outline"}
            -- o = {
            --     "<cmd>lua require('lsp_extensions.dart.outline').loclist({})<CR>",
            --     "outline"
            -- },
            -- O = {
            --     "<cmd>lua FlutterTelescopeOutline<CR>", "telescope outline"
            -- }
        }
    }
    wk.register(keymap, {
        prefix = '<localleader>',
        silent = true,
        noremap = true,
        mode = 'n',
        buffer = bufnr
    })
end

-- FlutterTelescopeOutline = function()
--     require('lsp_extensions.dart.outline').telescope(
--         {
--             telescope_opts = {
--                 borderchars = {
--                     '▃', '▐', '▀', '▍', '▃', '▃', '▀', '▀'
--                 }
--             }
--         })
-- end

local capabilities = require('plugins.lsp.capabilities').create()

-- require'lspconfig'.dartls.setup {
--     capabilities = capabilities,
--     init_options = {closingLabels = true, outline = true},
--     callbacks = {
--         ['dart/textDocument/publishClosingLabels'] = require(
--             'lsp_extensions.dart.closing_labels').get_callback(
--             {highlight = "Special", prefix = " >> "}),
--         ['dart/textDocument/publishOutline'] = require(
--             'lsp_extensions.dart.outline').get_callback()
--     },
--     on_attach = on_attach
-- }

require("flutter-tools").setup {
    experimental = {
        lsp_derive_paths = true -- experimental: Attempt to find the user's flutter SDK
    },
    widget_guides = {enabled = true},
    lsp = {on_attach = on_attach, capabilities = capabilities}
}
