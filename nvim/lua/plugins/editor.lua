return {
  -- Text manupulation
  {
    -- TODO: check for snacks integration in the future
    "johmsalas/text-case.nvim", -- change text cases
    cmd = { "Subs" },
    keys = { "<leader>tc" },
    opts = {
      prefix = "<leader>tc",
    },
  },
  {
    "Wansmer/treesj", -- Semantic split/join
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    keys = {
      { "<leader>tlj", "<Cmd>TSJJoin<CR>",   desc = "join",   mode = { "n", "x" } },
      { "<leader>tll", "<Cmd>TSJToggle<CR>", desc = "toggle", mode = { "n", "x" } },
      { "<leader>tls", "<Cmd>TSJSplit<CR>",  desc = "split" },
    },
    opts = {
      use_default_keymaps = false,
    },
  },
  {
    "Darazaki/indent-o-matic", -- quick correct expandtab/shiftwidth
    event = { "BufReadPre" },
  },

  {
    "guns/vim-sexp", -- TODO lua version
    keys = {
      { "<leader>kr", "<Plug>(sexp_raise_element)",        desc = "raise" },
      { "<leader>kR", "<Plug>(sexp_raise_list)",           desc = "RAISE" },
      { "<leader>ks", "<Plug>(sexp_capture_next_element)", desc = "slurp" },
    },
  },

  -- completion
  {
    "saghen/blink.cmp",
    version = "1.*", -- required to download pre-built bins
    opts = {
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" }, -- allow accept with Enter
      },
      completion = {
        ghost_text = {
          enabled = true,
          show_with_menu = false,
        },
        menu = {
          auto_show = false,
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "source_name" }, -- additional source field
            },
          },
        },
      },
    },
  },
}
