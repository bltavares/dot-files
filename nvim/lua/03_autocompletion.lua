-- autocomplete with lsp integration -- intelisense
vim.o.completeopt = "menuone,noselect"
local compe = require 'compe'
compe.setup {
    enabled = true,
    autocmplete = true,
    min_length = 2,
    documentation = true,
    preselect = 'enable',

    source = {
        path = true,
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
        vsnip = true,
        conjure = true,
    }
}

vim.api.nvim_command [[
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
]]
