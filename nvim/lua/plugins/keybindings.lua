return {
  {
    "folke/which-key.nvim", -- Keybindings helper
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
    config = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>;", "gcc", desc = "comment" },
        { "<localleader>=", "gg=G``", desc = "format" },
        {
          "gy",
          '"+y',
          desc = "Copy to system clipboard",
          mode = { "n", "x" },
        },
        {
          "gp",
          '"+p',
          desc = "Paste from system clipboard",
          mode = { "n" },
        },
        {
          "gp",
          '"+P',
          desc = "Paste from system clipboard",
          mode = { "x" },
        },
        {
          "gV",
          '"g`[" . strpart(getregtype(), 0, 1) . "g`]"',
          expr = true,
          replace_keycodes = false,
          desc = "Visually select changed text",
        },
        {
          "g/",
          "<esc>/\\%V",
          silent = false,
          desc = "Search inside visual selection",
          mode = { "x" },
        },
        { "<leader>T", group = "toggle" },
        { "<leader>f", group = "find" },
        { "<leader>fc", group = "commands" },
        { "<leader>fg", group = "git" },
        { "<leader>g", group = "git" },
        { "<leader>p", group = "project" },
        {
          { "<leader>b", group = "buffers" },
          { "<leader>bD", ":bufdo bd<CR>", desc = "do" },
        },
        {
          { "<leader>e", group = "editor" },
          {
            "<leader>ee",
            "<Cmd>lua vim.cmd.edit(vim.fn.stdpath('config') .. '/lua/setup/general.lua')<CR>",
            desc = "edit",
          },
          {
            "<leader>ep",
            "<Cmd>lua vim.cmd.edit(vim.fn.stdpath('config') .. '/lua/plugins/')<CR>",
            desc = "plugins",
          },
        },
        {
          { "<leader>q", group = "vim" },
          { "<leader>qq", "<Cmd>qa!<CR>", desc = "Quit!" },
          { "<leader>qr", "<Cmd>lua loadfile(vim.fn.stdpath('config') .. 'init.lua')<CR>", desc = "Reload" },
        },
        {
          { "<leader>t", group = "text" },
          { "<leader>t;", "gcc", desc = "comment" },
        },
        {
          { "<leader>w", group = "window" },
          { "<leader>wc", "<C-w>c", desc = "close" },
          { "<leader>wh", "<C-w>h", desc = "move left" },
          { "<leader>wj", "<C-w>j", desc = "move down" },
          { "<leader>wk", "<C-w>k", desc = "move top" },
          { "<leader>wl", "<C-w>l", desc = "move right" },
          { "<leader>w=", "<C-w>=", desc = "rebalance" },
          { "<leader>wm", "<Cmd>only<CR>", desc = "close others" },
          { "<leader>ws", "<Cmd>split<CR>", desc = "horizontal split" },
          { "<leader>wv", "<Cmd>vsplit<CR>", desc = "vertical split" },
          { "<leader>wn", "<Cmd>split<CR>", desc = "new" },
        },
        {
          { "<leader>wt", group = "tab" },
          { "<leader>wtc", "<Cmd>tabclose<CR>", desc = "close" },
          { "<leader>wtn", "<Cmd>tabnew<CR>", desc = "new" },
          { "<leader>wtt", "<Cmd>tabnext<CR>", desc = "next" },
        },
        -- groups from other plugins
        { "cr", group = "coercion" }, -- vim-abolish
        { "<localleader>d", group = "debug" }, -- dap
        { "<leader>k", group = "s-exp" }, -- vim-sexp
        { "<leader>tl", group = "line" }, -- treesJ
        { "<leader>ta", group = "align", mode = { "n", "v" } }, -- mini.align
        { "s", group = "surround" }, -- mini.surround
        { "<localleader>t", group = "test" }, -- neotest
      })

      if vim.g.neovide then
        wk.add({
          { "<leader>Tf", group = "font" },
          { "<leader>Tf+", "<CMD>lua FontIncrease()<CR>", desc = "+" },
          { "<leader>Tf-", "<CMD>lua FontDecrease()<CR>", desc = "-" },
          { "<leader>Tf0", "<CMD>lua FontReset()<CR>", desc = "reset" },
        })
      end

      wk.add({
        mode = { "v" },
        { "<leader>;", "gc", desc = "comment" },
        { "<leader>g", group = "git" },
        { "<leader>t", group = "text" },
      })
    end,
  },
}
