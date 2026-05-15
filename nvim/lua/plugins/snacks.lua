return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = {},
      dim = {},
      indent = {
        animate = {
          enabled = false,
        },
      },
      input = {},
      notifier = {},
      picker = {},
      scope = {},
      toggle = {},
      words = {},
      zen = {},
    },
    keys = {
      { "<C-p>", "<Cmd>lua Snacks.picker.commands()<CR>", desc = "commands" },
      { "<leader>qn", "<Cmd>lua Snacks.picker.notifications()<CR>", desc = "notifications" },
      { "<leader>qN", "<Cmd>lua Snacks.notifier.show_history()<CR>", desc = "Last notification" },
      { "<leader><space>", "<Cmd>lua Snacks.picker.resume()<CR>", desc = "resume panel" },
      { "<leader>*", "<Cmd>lua Snacks.picker.grep_word()<CR>", desc = "find word in project" },
      { "<leader>/", "<Cmd>lua Snacks.picker.grep()<CR>", desc = "grep" },
      { "<leader>bb", "<Cmd>lua Snacks.picker.buffers()<CR>", desc = "buffers" },
      { "<leader>fb", "<Cmd>lua Snacks.picker.buffers()<CR>", desc = "buffers" },
      { "<leader>fcc", "<Cmd>lua Snacks.picker.commands()<CR>", desc = "commands" },
      { "<leader>fch", "<Cmd>lua Snacks.picker.command_history()<CR>", desc = "history" },
      { "<leader>ff", "<Cmd>lua Snacks.picker.files()<CR>", desc = "files" },
      { "<leader>fgb", "<Cmd>lua Snacks.picker.git_branches()<CR>", desc = "branches" },
      { "<leader>fgc", "<Cmd>lua Snacks.picker.git_bcommits()<CR>", desc = "bcommits" },
      { "<leader>fgg", "<Cmd>lua Snacks.picker.git_commits()<CR>", desc = "commits" },
      { "<leader>fgs", "<Cmd>lua Snacks.picker.git_status()<CR>", desc = "status" },
      { "<leader>fh", "<Cmd>lua Snacks.picker.help()<CR>", desc = "help tags" },
      { "<leader>fq", "<Cmd>lua Snacks.picker.qflist()<CR>", desc = "quickfix" },
      { "<leader>p/", "<Cmd>lua Snacks.picker.live_grep()<CR>", desc = "grep" },
      { "<leader>pf", "<Cmd>lua Snacks.picker.files()<CR>", desc = "files" },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>Ts")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>TW")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>TL")
          Snacks.toggle.diagnostics():map("<leader>Td")
          Snacks.toggle.line_number():map("<leader>Tl")
          Snacks.toggle
            .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
            :map("<leader>Tc")
          Snacks.toggle.treesitter():map("<leader>TT")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>Tb")
          Snacks.toggle.inlay_hints():map("<leader>Th")
          Snacks.toggle.indent():map("<leader>Tw")
          Snacks.toggle.dim():map("<leader>TD")
          Snacks.toggle.zen():map("<leader>Tz")
          Snacks.toggle.zoom():map("<leader>TZ")
          Snacks.toggle
            .new({
              name = "Code Lens",
              get = function()
                return vim.lsp.codelens.is_enabled()
              end,
              set = function(state)
                vim.lsp.codelens.enable(state)
              end,
            })
            :map("<leader>TL")
        end,
      })
    end,
  },
}
