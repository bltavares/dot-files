local on_attach = require("config.lsp.on_attach")

local local_on_attach = function(client, bufnr)
  on_attach(client, bufnr)
  local wk = require("which-key")
  wk.add({
    { buffer = bufnr, remap = false },
    {
      { "<localleader>c", "<cmd>lua require('telescope').extensions.flutter.commands()<CR>", desc = "commands" },
      { "<localleader>rO", "<cmd>FlutterOutline<CR>", desc = "outline" },
      { "<localleader>rR", "<cmd>FlutterRestart<CR>", desc = "restart" },
      { "<localleader>rr", "<cmd>FlutterReload<CR>", desc = "reload" },
    },
    {
      { "<localleader>rD", group = "devices" },
      { "<localleader>rDd", "<cmd>FlutterDevices<CR>", desc = "devices" },
      { "<localleader>rDe", "<cmd>FlutterEmulators<CR>", desc = "emulators" },
      { "<localleader>rDq", "<cmd>FlutterQuite<CR>", desc = "quit" },
      { "<localleader>rDr", "<cmd>FlutterRun<CR>", desc = "run" },
      { "<localleader>rDt", "<cmd>FlutterDevTools<CR>", desc = "dev tools" },
    },
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

local capabilities = require("config.lsp.capabilities").create()

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

require("flutter-tools").setup({
  experimental = {
    lsp_derive_paths = true, -- experimental: Attempt to find the user's flutter SDK
  },
  widget_guides = { enabled = true },
  lsp = { on_attach = local_on_attach, capabilities = capabilities },
})
