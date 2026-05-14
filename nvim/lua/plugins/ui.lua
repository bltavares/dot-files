local function LspStatus()
  local names = vim.tbl_map(function(server)
    return server.name
  end, vim.lsp.get_clients({ bufnr = 0 }))

  return #names > 0 and "%#Conditional#" .. "[✓ " .. table.concat(names, " ") .. "]" or ""
end

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
    "brenoprata10/nvim-highlight-colors", -- colorize #abc123 colors, LSP support for textDocument/documentColor
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
      render = "virtual",
    },
  },
  {
    "petertriho/nvim-scrollbar", -- UI decoration minimap
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
      handlers = {
        gitsigns = true,
      },
    },
    dependencies = {
      "lewis6991/gitsigns.nvim",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = { "VeryLazy" },
    opts = {
      options = {
        icons_enabled = false,
        section_separators = "",
        component_separators = "",
      },
      extensions = { "quickfix", "nvim-tree" },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          { "filename", file_status = true },
          {
            "project",
            format = "short", -- name is better, but windows issues
            enclose_pair = { "<", ">" },
          },
        },
        lualine_x = {
          { "diagnostics", sources = { "nvim_diagnostic" } },
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "location" },
        lualine_z = { LspStatus },
      },
      winbar = {
        lualine_b = {
          {
            "filename",
            cond = function()
              return require("nvim-navic").is_available()
            end,
          },
        },
        lualine_c = {
          { "navic" },
        },
      },
    },
  },
}
