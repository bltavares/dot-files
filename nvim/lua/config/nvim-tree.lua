require'nvim-tree'.setup {
    -- allow nvim .
    -- https://github.com/kyazdani42/nvim-tree.lua/issues/248
    -- disable_netrw = 0
    -- hijack_netrw = 0
    diagnostics = { enable = true },
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

local function open_nvim_tree(data)

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
