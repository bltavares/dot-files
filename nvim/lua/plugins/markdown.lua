return {
  {
    "topazape/md-preview.nvim",
    cmd = { "MPToggle" },
    ft = "markdown",
    keys = {
      { "<localleader>P", "<CMD>MPToggle<CR>", desc = "Preview", ft = "markdown" },
    },
    opts = {
      viewer = {
        exec = "mdcat",
        args = { "--local" },
      },
    },
  },
}
