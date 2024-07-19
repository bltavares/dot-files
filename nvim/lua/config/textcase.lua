require("textcase").setup({})
require("telescope").load_extension("textcase")

local wk = require("which-key")
wk.add({
  {"ga.", "<cmd>TextCaseOpenTelescope<CR>", desc = "textcase menu", mode = {"n", "v"} },
})
