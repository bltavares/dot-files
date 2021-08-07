local wk = require('which-key')

local on_attach = function(client, bufnr)
    require 'utils.lsp.on_attach'(client, bufnr);
    local keymap = {
        c = {"<cmd>Telescope flutter commands<CR>", "commands"},
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
        bufnr = bufnr
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

local capabilities = require('utils.lsp.capabilities').create()

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

require("telescope").load_extension("flutter")

-- In order for neovim to launch certain executables on Windows, it must append .cmd to the command name. A fix is in the works upstream, but until this is mainlined please the following somewhere in your init.vim (lua heredoc) or init.lua:
vim.loop.spawn = (function()
    local spawn = vim.loop.spawn
    return function(path, options, on_exit)
        local full_path = vim.fn.exepath(path)
        return spawn(full_path, options, on_exit)
    end
end)()
