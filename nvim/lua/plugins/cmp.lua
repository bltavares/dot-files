-- autocomplete with lsp integration -- intelisense
vim.o.completeopt = "menuone,noselect"
-- vim.o.completeopt = "menu,menuone,noselect"
local cmp = require'cmp'

cmp.setup({
		snippet = {
				expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
				end,
		},
		mapping = {
				['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
				['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
				['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
				['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
				['<C-e>'] = cmp.mapping({
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
				}),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
		},
		sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'vsnip' },
				{ name = 'conjure' },
		}, {
						{ name = 'buffer' },
				})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
		sources = {
				{ name = 'buffer' }
		}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
		sources = cmp.config.sources({
				{ name = 'path' }
		}, {
						{ name = 'cmdline' }
				})
})


vim.api.nvim_command [[
autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
]]
