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

return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeRefresh" },
    keys = {
      { "<leader>pT", "<Cmd>NvimTreeFindFile<CR>", desc = "show on tree" },
      { "<leader>pr", "<Cmd>NvimTreeRefresh<CR>", desc = "refresh tree" },
      { "<leader>pt", "<Cmd>NvimTreeToggle<CR>", desc = "project tree" },
    },
    opts = {
      -- allow nvim .
      -- https://github.com/kyazdani42/nvim-tree.lua/issues/248
      -- disable_netrw = 0
      -- hijack_netrw = 0
      sync_root_with_cwd = true,
      respect_buf_cwd = true, -- project.nvim
      update_focused_file = {
        enable = true, -- project.nvim
        update_root = true, --project.nvim
      },
      diagnostics = { enable = true },
      renderer = {
        highlight_git = true,
        group_empty = true,
        indent_markers = { enable = true },
        icons = {
          show = { git = true, folder = true, file = true },
          glyphs = {
            git = {
              unstaged = "~",
              staged = "+",
              unmerged = "!",
              renamed = "≈",
              untracked = "?",
              deleted = "-",
            },
            folder = {
              default = "▸",
              open = "▾",
              empty = "▸",
              empty_open = "▾",
              symlink = "▸",
              symlink_open = "▾",
            },
          },
        },
      },
    },
    init = function()
      -- Open nvim-tree when a dir is passed and it's not a file
      vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    end,
  },

  {
    "DrKJeff16/project.nvim", -- auto cwd to .git projects
    event = { "VeryLazy" },
    keys = {
      { "<leader>ps", "<Cmd>ProjectSnacks<CR>", desc = "switch" },
    },
    opts = {
      snacks = { enabled = true },
    },
  },
  {
    "folke/lsp-trouble.nvim", -- LSP based problem list
    cmd = { "Trouble", "TroubleToggle" },
    keys = {
      { "<leader>pd", "<Cmd>Trouble diagnostics<CR>", desc = "diagnostics" },
    },
    opts = {},
  },
  {
    "hedyhli/outline.nvim", -- LSP based buffer object/fn outlines - alternative to `gO`
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    opts = {},
  },
  {
    "folke/todo-comments.nvim", -- Colorize and find things to do
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    cmd = { "TodoTrouble", "TodoQuickFix", "TodoLocList" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false,
    },
    keys = {
      { "<leader>p?", "<Cmd>TodoTrouble<CR>", desc = "TODOs" },
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next todo comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous todo comment",
      },
    },
  },
  {
    "linrongbin16/gitlinker.nvim",
    cmd = { "GitLink" },
    opts = {},
    keys = {
      { "<leader>gl", "<Cmd>GitLink<CR>", desc = "link", mode = { "n", "v" } },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    keys = {
      { "<leader>gb", "<Cmd>Gitsigns toggle_current_line_blame<CR>", desc = "blame" },
      { "<leader>gs", "<Cmd>Gitsigns toggle_signs<CR>", desc = "signs" },
    },
    opts = {},
  },
}
