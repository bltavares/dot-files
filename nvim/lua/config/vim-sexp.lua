-- Explicit s-exp mappings
-- vim.g.sexp_filetypes = ''
local wk = require("which-key")

local keymap = {
  r = { "<Plug>(sexp_raise_element)", "raise" },
  R = { "<Plug>(sexp_raise_list)", "RAISE" },
  s = { "<Plug>(sexp_capture_next_element)", "slurp" },
}

wk.register(keymap, { mode = "n", prefix = "<leader>k" })
