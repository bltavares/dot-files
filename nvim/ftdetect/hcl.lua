vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*.nomad",
  },
  callback = function()
    vim.bo.filetype = "hcl.nomad"
  end,
})
