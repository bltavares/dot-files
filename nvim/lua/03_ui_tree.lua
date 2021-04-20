-- allow nvim .
-- https://github.com/kyazdani42/nvim-tree.lua/issues/248
-- vim.g.nvim_tree_disable_netrw = 0
-- vim.g.nvim_tree_hijack_netrw = 0
vim.g.nvim_tree_show_icons = { git = 1, folders = 1, files = 0 }
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_icons = {
  git = {
    unstaged = "~",
    staged = "+",
    unmerged = "!",
    renamed = "≈",
    untracked = "?",
    deleted = "-"
  },
  folder = {
    default = "▸",
    open = "▾",
    empty = "▸",
    empty_open = "▾",
    symlink = "▸",
    symlink_open = "▾",
  },
}
