require("nvim_comment").setup({
  hook = function()
    require("ts_context_commentstring").update_commentstring()
  end,
})
