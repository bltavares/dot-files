local wk = require("which-key")
local capabilities = require("config.lsp.capabilities").create()

-- TODO
-- https://github.com/guns/vim-sexp
-- https://github.com/eraserhd/parinfer-rust
require("lspconfig").clojure_lsp.setup({
  on_attach = function(client, bufnr)
    require("config.lsp.on_attach")(client, bufnr)

    local keymap = {
      s = {
        name = "+repl",
        j = { "<CMD>Lein<CR>", "jackin" },
        c = { "<CMD>ConjureConnect<CR>", "connect" },
        s = { "<CMD>ConjureLogSplit<CR>", "log buffer" },
        r = { "<CMD>ConjureCljRefreshChanged<CR>", "refresh namespaces" },
        R = { "<CMD>ConjureCljRefreshAll<CR>", "Force refresh namespaces" },
      },
      l = {
        name = "+log",
        s = "split",
        v = "vertical",
        t = "tab",
        r = "reset",
        R = "reset & close",
      },
      r = {
        A = "Refresh All!",
      },
      e = {
        name = "+eval",
        b = "buffer",
        e = "at point",
        r = "outer",
        w = "inspect",
        ["!"] = "replace",
      },
      t = {
        name = "+test",

        n = "namespace",
        a = "all lodead",
        c = "at point",
        N = "alternate ns",

        t = { "<CMD>ConjureCljRunCurrentTest<CR>", "nearest" },
        f = { "<CMD>ConjureCljRunCurrentNsTests<CR>", "file" },
        s = { "<CMD>ConjureCljRunAllTests<CR>", "suite" },
        T = { "<CMD>ConjureCljRunAlternatNsTests<CR>", "alternate ns" },
        l = { '<CMD>echo "Not Available in clj"<CR>', "last" },
        v = { '<CMD>echo "Not Available in clj"<CR>', "visit" },
      },
    }
    wk.register(keymap, {
      prefix = "<localleader>",
      silent = true,
      noremap = true,
      mode = "n",
      buffer = bufnr,
    })
  end,
  capabilities = capabilities,
})
