require("textcase").setup({})
require("telescope").load_extension("textcase")

local wk = require("which-key")
local keymap = {
  ["ga."] = { "<cmd>TextCaseOpenTelescope<CR>", "textcase menu" },
}

wk.register(keymap, { mode = "n" })
wk.register(keymap, { mode = "v" })
