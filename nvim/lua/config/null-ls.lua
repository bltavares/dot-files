local null_ls = require("null-ls")

local on_attach = require("config.lsp.on_attach")
local capabilities = require("config.lsp.capabilities").create()

null_ls.register(require("none-ls-shellcheck.diagnostics"))
null_ls.register(require("none-ls-shellcheck.code_actions"))

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.stylua,
  },
  on_attach = on_attach,
  capabilities = capabilities,
})
