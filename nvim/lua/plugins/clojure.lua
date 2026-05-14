return {
  -- clojure
  {
    "Olical/conjure",
    ft = { "clojure" },
    -- https://github.com/PaterJason/cmp-conjure/pull/6
    -- dependencies = { "saghen/blink.compat", "PaterJason/cmp-conjure" },
    config = function()
      require("conjure.main").main()
      require("conjure.mapping")["on-filetype"]()
    end,
    init = function()
      vim.g["conjure#filetypes"] = { "clojure" }
      vim.g["conjure#client#clojure#nrepl#mapping#refresh_all"] = "rA"
    end,
  },
  {
    "clojure-vim/vim-jack-in", -- allow dispatching nrepl from vim
    dependencies = { "tpope/vim-dispatch", "radenling/vim-dispatch-neovim" },
    ft = { "clojure" },
  },
  { "tpope/vim-dispatch", cmd = { "Dispatch", "Make", "Focus", "Start" } },
}
