# TODOs

## Config
- Migrate from old config = require'x'.setup() end to just using the opts = {}
- Migrate to use `return { } ` plugin files for lazy split

## lsp
- https://github.com/ray-x/lsp_signature.nvim -- LSP Signature support -- replaced by lspsaga
- https://github.com/gbrlsnchs/telescope-lsp-handlers.nvim

## Text
- https://github.com/kylechui/nvim-surround -- tpop/vim-surround in lua :)

- https://github.com/monaqa/dial.nvim -- Better increment/decrement
- https://github.com/windwp/nvim-autopairs
- https://github.com/gyim/vim-boxdraw -- Crazy good box drawing
- https://github.com/windwp/nvim-ts-autotag
```lua
autotag = {
    enable = true,
    filetypes = { "html" , "xml" },
}

## UI
- https://github.com/stevearc/dressing.nvim -- already using lsp saga - worth it?
- Fix Cmd-v on neovide: inoremap <D-v> <C-W>"

### Theme
- https://github.com/shaunsingh/moonlight.nvim -- purple-ish goodness

## Languages

### Yaml / k8s
-- missing yaml support https://github.com/phelipetls/jsonpath.nvim/issues/1
- https://github.com/phelipetls/jsonpath.nvim 
- https://github.com/b0o/SchemaStore.nvim

### debug
- https://github.com/mfussenegger/nvim-dap
- https://github.com/theHamsta/nvim-dap-virtual-text

## Git
- https://github.com/NeogitOrg/neogit -- too much

## AI
- https://github.com/zbirenbaum/copilot-cmp

-- relying of none-ls as it has Code actions and these don't
### Lint
- https://github.com/mfussenegger/nvim-lint

### Formatting 
- https://github.com/stevearc/conform.nvim
