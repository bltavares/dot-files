return {
  {
    "folke/tokyonight.nvim", -- theme
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors", -- colorize #abc123 colors
    opts = {
      render = "virtual",
      virtual_symbol = "■",
    },
  },
  {
    "petertriho/nvim-scrollbar", -- UI decoration minimap
    opts = {},
  },
}
