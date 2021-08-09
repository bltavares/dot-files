
local wk = require('which-key')
local capabilities = require'plugins.lsp.capabilities'.create()

require'lspconfig'.sumneko_lua.setup {
  cmd = {vim.fn.exepath('lua-language-server')};
  on_attach = function(client, bufnr)
    require 'plugins.lsp.on_attach'(client, bufnr);

    local keymap = {
      e = {
        name = "+eval",
        f = {"<cmd>luafile %<CR><cmd>echo 'Evaled' @%<cr>", "file"},
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
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      -- Do not send telemetry ata containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
    return ...
end
