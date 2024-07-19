-- Explicit s-exp mappings
-- vim.g.sexp_filetypes = ''
local wk = require("which-key")

wk.add({
  { "<leader>kr", "<Plug>(sexp_raise_element)", desc = "raise" },
  { "<leader>kR", "<Plug>(sexp_raise_list)", desc = "RAISE" },
  { "<leader>ks", "<Plug>(sexp_capture_next_element)", desc = "slurp" },
})
