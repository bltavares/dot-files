return {
  {
    "npxbr/glow.nvim", -- Preview .md rendering
    cmd = { "Glow" },
    ft = "markdown",
    keys = {
      { "<localleader>P", "<CMD>Glow<CR>", desc = "Preview", ft = "markdown" },
    },
    opts = {},
  },
}
