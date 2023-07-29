require'nvim-tree'.setup {
    -- allow nvim .
    -- https://github.com/kyazdani42/nvim-tree.lua/issues/248
    -- disable_netrw = 0
    -- hijack_netrw = 0
    diagnostics = { enable = true },
    open_on_setup = true,
    renderer = {
        highlight_git = true,
        group_empty = true,
        indent_markers = { enable = true },
        icons = {
            show = {git = true, folder = true, file = false},
            glyphs = {
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
            },
        },
    },
}
