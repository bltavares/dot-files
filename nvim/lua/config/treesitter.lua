require'nvim-treesitter.configs'.setup {
    ensure_installed = {'rust', 'dart', 'lua', 'comment', 'markdown', 'markdown_inline', 'yaml','hcl', },
    highlight = {enable = true},
    indent = {enable = true},
    rainbow = {
        enable = true,
        extended_mode = true -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    }
}

-- Experimental: Breaks on insert, starts unfolded but folds on first type
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.o.foldlevel = 0
-- vim.o.foldlevelstart = 0
vim.o.foldnestmax = 3 -- Maximum nested folds
vim.o.foldenable = false -- dont fold by default
