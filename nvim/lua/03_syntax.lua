-- highlight on yank
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank()')

require'nvim-treesitter.configs'.setup {
    ensure_installed = {'rust', 'dart', 'lua'},
    highlight = {enable = true},
    indent = {enable = true},
    rainbow = {
        enable = true,
        extended_mode = true -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    },
    -- https://github.com/windwp/nvim-ts-autotag
    -- autotag = {
    --     enable = true,
    --     filetypes = { "html" , "xml" },
    --   }
    -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    -- context_commentstring = {
    --     enable = true
    --   }
}

-- Experimental: Breaks on insert, starts unfolded but folds on first type
-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.o.foldlevel = 0
-- vim.o.foldlevelstart = 0
