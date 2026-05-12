-- TODO move to plugins
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
        { "<C-p>", "<Cmd>lua Snacks.picker.commands()<CR>", desc = "commands", remap = false },
      })

      -- TODO: git/fugitive keybindings
      -- TODO: session keybindings
      -- TODO: mode-mapping of localleader
      -- TODO: dap-debug keybindings
      -- TODO: access localleader maps over normal leader through m
      wk.add({
        {
          {
            "<leader><space>",
            "<Cmd>lua Snacks.picker.resume()<CR>",
            desc = "resume panel",
          },
          {
            "<leader>*",
            "<Cmd>lua Snacks.picker.grep_word()<CR>",
            desc = "find word in project",
          },
          {
            "<leader>/",
            "<Cmd>lua Snacks.picker.grep()<CR>",
            desc = "grep",
          },
          {
            "<leader>;",
            "<Cmd>CommentToggle<CR>",
            desc = "comment",
          },
        },
        {
          { "<leader>T", group = "toggle" },
          {
            "<leader>TI",
            "<Cmd>IlluminateToggle<CR>",
            desc = "Illuminate reference",
          },
          {
            "<leader>Tr",
            "<Cmd>LspLensToggle<CR>",
            desc = "Fn references",
          },
        },
        {
          { "<leader>b", group = "buffers" },
          { "<leader>bD", ":bufdo bd<CR>", desc = "do" },
          { "<leader>bb", "<Cmd>lua Snacks.picker.buffers()<CR>", desc = "buffers" },
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
          { "<leader>f", group = "find" },
          { "<leader>fb", "<Cmd>lua Snacks.picker.buffers()<CR>", desc = "buffers" },
        },
        {
          { "<leader>fc", group = "commands" },
          { "<leader>fcc", "<Cmd>lua Snacks.picker.commands()<CR>", desc = "commands" },
          { "<leader>fch", "<Cmd>lua Snacks.picker.command_history()<CR>", desc = "history" },
          { "<leader>ff", "<Cmd>lua Snacks.picker.files()<CR>", desc = "files" },
        },
        {
          { "<leader>fg", group = "git" },
          { "<leader>fgb", "<Cmd>lua Snacks.picker.git_branches()<CR>", desc = "branches" },
          { "<leader>fgc", "<Cmd>lua Snacks.picker.git_bcommits()<CR>", desc = "bcommits" },
          { "<leader>fgg", "<Cmd>lua Snacks.picker.git_commits()<CR>", desc = "commits" },
          { "<leader>fgs", "<Cmd>lua Snacks.picker.git_status()<CR>", desc = "status" },
          { "<leader>fh", "<Cmd>lua Snacks.picker.help()<CR>", desc = "help tags" },
          { "<leader>fq", "<Cmd>lua Snacks.picker.qflist()<CR>", desc = "quickfix" },
        },
        {
          { "<leader>g", group = "git" },
          { "<leader>gb", "<Cmd>Gitsigns toggle_current_line_blame<CR>", desc = "blame" },
          { "<leader>gs", "<Cmd>Gitsigns toggle_signs<CR>", desc = "signs" },
          { "<leader>gl", "<Cmd>GitLink<CR>", desc = "link" },
        },
        {
          { "<leader>p", group = "project" },
          { "<leader>p/", "<Cmd>lua Snacks.picker.live_grep()<CR>", desc = "grep" },
          { "<leader>p?", "<Cmd>TodoTrouble<CR>", desc = "todos" },
          { "<leader>pT", "<Cmd>NvimTreeFindFile<CR>", desc = "show on tree" },
          { "<leader>pf", "<Cmd>lua Snacks.picker.files()<CR>", desc = "files" },
          { "<leader>pr", "<Cmd>NvimTreeRefresh<CR>", desc = "refresh tree" },
          { "<leader>ps", "<Cmd>ProjectSnacks<CR>", desc = "switch" },
          { "<leader>pt", "<Cmd>NvimTreeToggle<CR>", desc = "project tree" },
        },
        {
          { "<leader>q", group = "vim" },
          { "<leader>qq", "<Cmd>qa!<CR>", desc = "Quit!" },
          { "<leader>qr", "<Cmd>lua loadfile(vim.fn.stdpath('config') .. 'init.lua')<CR>", desc = "Reload" },
        },
        {
          { "<leader>t", group = "text" },
          { "<leader>t/", "<Cmd>CommentToggle<CR>", desc = "comment" },
        },
        {
          { "<leader>ta", group = "align" },
          { "<leader>ta(", "vi(<C-v>$:EasyAlign\\ g/^\\S/<CR>", desc = "()" },
          { "<leader>ta[", "vi[<C-v>$:EasyAlign\\ g/^\\S/<CR>", desc = "[]" },
          { "<leader>taa", "<PLUG>(EasyAlign)", desc = "interactive" },
          { "<leader>ta{", "vi{<C-v>$:EasyAlign\\ g/^\\S/<CR>", desc = "{}" },
        },
        {
          { "<leader>w", group = "window" },
          { "<leader>wc", "<C-w>c", desc = "close" },
          { "<leader>wh", "<C-w>h", desc = "move left" },
          { "<leader>wj", "<C-w>j", desc = "move down" },
          { "<leader>wk", "<C-w>k", desc = "move top" },
          { "<leader>wl", "<C-w>l", desc = "move right" },
          { "<leader>wm", "<Cmd>only<CR>", desc = "maximize split" },
          { "<leader>ws", "<Cmd>split<CR>", desc = "horizontal split" },
        },
        {
          { "<leader>wt", group = "tab" },
          { "<leader>wtc", ":tabclose<CR>", desc = "close" },
          { "<leader>wtn", ":tabnew<CR>", desc = "new" },
          { "<leader>wtt", ":tabnext<CR>", desc = "next" },
          { "<leader>wv", "<Cmd>vsplit<CR>", desc = "vertical split" },
        },
        -- groups from other plugins
        { "cr", group = "coercion" }, -- vim-abolish
        { "<localleader>d", group = "debug" }, -- dap
        { "<leader>k", group = "s-exp" }, -- vim-sexp
        { "<leader>tl", group = "line" }, -- treesJ
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
        { "<leader>;", ":CommentToggle<cr>", desc = "comment" },
        {
          { "<leader>g", group = "git" },
          { "<leader>gl", "<Cmd>GitLink<CR>", desc = "git link" },
        },
        {
          { "<leader>t", group = "text" },
        },
        {
          { "<leader>ta", group = "align" },
          { "<leader>ta(", ":EasyAlign\\ g/^\\S/<CR>", desc = "()" },
          { "<leader>ta,", ":Tabularize /,<CR>", desc = "," },
          { "<leader>ta-", ":Tabularize /-<CR>", desc = "-" },
          { "<leader>ta=", ":Tabularize /=<CR>", desc = "=" },
          { "<leader>ta[", ":EasyAlign\\ g/^\\S/<CR>", desc = "[]" },
          { "<leader>taa", "<PLUG>(EasyAlign)", desc = "interactive" },
          { "<leader>ta{", ":EasyAlign\\ g/^\\S/<CR>", desc = "{}" },
          { "<leader>ta|", ":Tabularize /|<CR>", desc = "|" },
        },
      })

      wk.add({
        { "<localleader>=", "gg=G``", desc = "format", remap = false },
        {
          { "<localleader>t", group = "test", remap = false },
          { "<localleader>tO", "<Cmd>Neotest output-panel<CR>", desc = "output", remap = false },
          { "<localleader>tf", "<Cmd>Neotest run file<CR>", desc = "file", remap = false },
          { "<localleader>tl", "<Cmd>Neotest run last<CR>", desc = "last", remap = false },
          { "<localleader>to", "<Cmd>Neotest output<CR>", desc = "output", remap = false },
          { "<localleader>ts", "<Cmd>Neotest summary<CR>", desc = "summary", remap = false },
          { "<localleader>tt", "<Cmd>Neotest run<CR>", desc = "nearest", remap = false },
        },
      })
    end,
  },
}
