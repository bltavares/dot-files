return {
  {
    "nvim-treesitter/nvim-treesitter", -- Syntax highlighting and query engine (archived as of 2026-04)
    event = { "BufReadPre", "BufNewFile", "VeryLazy" },
    build = ":TSUpdate",
    config = function()
      local ensure_installed = {
        "comment",
        "dart",
        "go",
        "hcl",
        "lua",
        "markdown",
        "markdown_inline",
        "rust",
        "yaml",
      }
      vim.defer_fn(function()
        require("nvim-treesitter").install(ensure_installed)
      end, 1000)
      require("nvim-treesitter").update()

      -- auto-start highlights & indentation
      vim.api.nvim_create_autocmd("FileType", {
        desc = "User: enable treesitter highlighting",
        callback = function(ctx)
          -- highlights
          local hasStarted = pcall(vim.treesitter.start) -- errors for filetypes with no parser
          -- indent
          local noIndent = {}
          if hasStarted and not vim.list_contains(noIndent, ctx.match) then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })

      -- Experimental: Breaks on insert, starts unfolded but folds on first type
      vim.o.foldmethod = "expr"
      vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      -- vim.o.foldlevel = 0
      -- vim.o.foldlevelstart = 0
      vim.o.foldnestmax = 3    -- Maximum nested folds
      vim.o.foldenable = false -- dont fold by default
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "folke/ts-comments.nvim", -- changes comment string based on location for embedded langs in same file
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
  {
    "code-biscuits/nvim-biscuits", -- scope context virtual text
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      cursor_line_only = true,
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "windwp/nvim-ts-autotag", -- Automatically add closing tags for HTML and JSX
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}
