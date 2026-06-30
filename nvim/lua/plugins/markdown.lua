return {
  {
    --"topazape/md-preview.nvim",
    -- HACK: https://github.com/topazape/md-preview.nvim/pull/1
    "bltavares/md-preview.nvim",
    branch = 'fix-win-11-support',
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
