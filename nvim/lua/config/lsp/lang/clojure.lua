local wk = require("which-key")
local capabilities = require("config.lsp.capabilities").create()
local on_attach = require("config.lsp.on_attach")

-- TODO
-- https://github.com/guns/vim-sexp
-- https://github.com/eraserhd/parinfer-rust
require("lspconfig").clojure_lsp.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    wk.add({
      { buffer = bufnr, remap = false },
      {
        { "<localleader>e", group = "eval" },
        { "<localleader>e!", desc = "replace" },
        { "<localleader>eb", desc = "buffer" },
        { "<localleader>ee", desc = "at point" },
        { "<localleader>er", desc = "outer" },
        { "<localleader>ew", desc = "inspect" },
      },
      {
        { "<localleader>l", group = "log" },
        { "<localleader>lR", desc = "reset & close" },
        { "<localleader>lr", desc = "reset" },
        { "<localleader>ls", desc = "split" },
        { "<localleader>lt", desc = "tab" },
        { "<localleader>lv", desc = "vertical" },
        { "<localleader>rA", desc = "Refresh All!" },
      },
      {

        { "<localleader>s", group = "repl" },
        { "<localleader>sR", "<CMD>ConjureCljRefreshAll<CR>", desc = "Force refresh namespaces" },
        { "<localleader>sc", "<CMD>ConjureConnect<CR>", desc = "connect" },
        { "<localleader>sj", "<CMD>Lein<CR>", desc = "jackin" },
        { "<localleader>sr", "<CMD>ConjureCljRefreshChanged<CR>", desc = "refresh namespaces" },
        { "<localleader>ss", "<CMD>ConjureLogSplit<CR>", desc = "log buffer" },
      },
      {
        { "<localleader>t", group = "test" },
        { "<localleader>tN", desc = "alternate ns" },
        { "<localleader>tT", "<CMD>ConjureCljRunAlternatNsTests<CR>", desc = "alternate ns" },
        { "<localleader>ta", desc = "all lodead" },
        { "<localleader>tc", desc = "at point" },
        { "<localleader>tf", "<CMD>ConjureCljRunCurrentNsTests<CR>", desc = "file" },
        { "<localleader>tl", '<CMD>echo "Not Available in clj"<CR>', desc = "last" },
        { "<localleader>tn", desc = "namespace" },
        { "<localleader>ts", "<CMD>ConjureCljRunAllTests<CR>", desc = "suite" },
        { "<localleader>tt", "<CMD>ConjureCljRunCurrentTest<CR>", desc = "nearest" },
        { "<localleader>tv", '<CMD>echo "Not Available in clj"<CR>', desc = "visit" },
      },
    })
  end,
  capabilities = capabilities,
})
