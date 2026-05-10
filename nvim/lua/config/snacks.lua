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
  end,
})
