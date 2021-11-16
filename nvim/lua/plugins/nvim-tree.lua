require'nvim-tree'.setup {
    -- allow nvim .
    -- https://github.com/kyazdani42/nvim-tree.lua/issues/248
    -- disable_netrw = 0
    -- hijack_netrw = 0
    show_icons = {git = true, folders = true, files = false},
    git_hl = true,
    auto_open = true,
    auto_close = true,
    indent_markers = true,
    group_empty = true,
    icons = {
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
            symlink_open = "▾"
        }
    }
}
