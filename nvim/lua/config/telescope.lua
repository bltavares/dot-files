local actions = require("telescope.actions")
local telescope = require("telescope")
telescope.setup({
  defaults = {
    mappings = { i = { ["<C-x>"] = false, ["<C-q>"] = actions.send_to_qflist } },
  },
})
telescope.load_extension("projects")
