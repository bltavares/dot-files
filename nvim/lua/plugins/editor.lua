return {
  -- Text manupulation
  { "godlygeek/tabular", cmd = "Tabularize" }, -- TODO lua version
  { "junegunn/vim-easy-align" }, -- TODO: lazy loading and lua version
  {
    "johmsalas/text-case.nvim", -- change text cases TODO replace with vim-abolish?
    setup = {}, -- TODO check for snacks integration in the future/for-
  },
  {
    "Wansmer/treesj", -- Semantic split/join
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    keys = {
      { "<leader>tlj", "<Cmd>TSJJoin<CR>",   desc = "join" },
      { "<leader>tll", "<Cmd>TSJToggle<CR>", desc = "toggle" },
      { "<leader>tls", "<Cmd>TSJSplit<CR>",  desc = "split" },
    },
    opts = {
      use_default_keymaps = false,
    },
  },
  -- TODO search for lua versions
  "tpope/vim-surround", -- surround motions
  "tpope/vim-sleuth", -- use correct expandtab/shiftwidth
  {
    "tpope/vim-abolish", -- smarter search/replace
    cmd = { "Abolish", "Subvert", "S" },
    keys = {
      { "crs", desc = "Snake Case" },
      { "cr_", desc = "Snake Case" },
      { "crm", desc = "Mixed Case" },
      { "crc", desc = "Camel Case" },
      { "cru", desc = "Snake Upper Case" },
      { "crU", desc = "Snake Upper Case" },
      { "crk", desc = "Kebab Case" },
      { "crt", desc = "Title Case (not reversible)" },
      { "cr-", desc = "Kebab Case (not reversible)" },
      { "cr.", desc = "Dot Case (not reversible)" },
      { "cr<space>", desc = "Space Case (not reversible)" },
    },
  },

  "tpope/vim-unimpaired", -- better % pairing

  {
    "guns/vim-sexp", -- TODO lua version
    keys = {
      { "<leader>kr", "<Plug>(sexp_raise_element)", desc = "raise" },
      { "<leader>kR", "<Plug>(sexp_raise_list)", desc = "RAISE" },
      { "<leader>ks", "<Plug>(sexp_capture_next_element)", desc = "slurp" },
    },
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring", -- changes comment string based on location for embedded langs in same file
    opts = { enable_autocmd = false },
  },
  {
    "terrortylor/nvim-comment",
    cmd = { "CommentToggle" },
    main = "nvim_comment",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    opts = {
      hook = function()
        require("ts_context_commentstring").update_commentstring()
      end,
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
