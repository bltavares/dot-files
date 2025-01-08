local wk = require("which-key")
local capabilities = require("config.lsp.capabilities").create()
local on_attach = require("config.lsp.on_attach")

local function locateLSP()
  local _, path = pcall(vim.fn.exepath, "lua-language-server")
  if path and path ~= "" then
    return { path }
  end
  return { "lua-language-server" }
end

_G.locateLSP = locateLSP

require("lspconfig").lua_ls.setup({
  cmd = locateLSP(),
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    wk.add({
      { buffer = bufnr, remap = false },
      { "<localleader>e", group = "eval" },
      { "<localleader>ef", "<cmd>luafile %<CR><cmd>echo 'Evaled' @%<cr>", desc = "file" },
    })
  end,
  capabilities = capabilities,
  settings = {
    Lua = {
      hint = {
        enable = true,
      },
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry ata containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  print(unpack(objects))
  return ...
end
