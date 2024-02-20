# TODOs

## Config
- Migrate from old config = require'x'.setup() end to just using the opts = {}
- Migrate to use `return { } ` plugin files for lazy split

## lsp
- https://github.com/VidocqH/lsp-lens.nvim
- Automatic language installer on TS
- https://github.com/ray-x/lsp_signature.nvim -- LSP Signature support -- replaced by lspsaga
- https://github.com/gbrlsnchs/telescope-lsp-handlers.nvim

## Text
- https://github.com/kylechui/nvim-surround

- https://github.com/monaqa/dial.nvim -- Better increment/decrement
- https://github.com/windwp/nvim-autopairs
- https://github.com/gyim/vim-boxdraw -- Crazy good box drawing
- https://github.com/windwp/nvim-ts-autotag
```lua
autotag = {
    enable = true,
    filetypes = { "html" , "xml" },
}
- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
```lua
context_commentstring = {
    enable = true
}
```

## UI
- https://github.com/lukas-reineke/indent-blankline.nvim 
- https://github.com/petertriho/nvim-scrollbar
- https://github.com/stevearc/dressing.nvim -- already using lsp saga - worth it?
- https://github.com/RRethy/vim-illuminate (solved manually already, do I need a plugin?)
- https://github.com/kdav5758/TrueZen.nvim
- Fix Cmd-v on neovide: inoremap <D-v> <C-W>"

### Theme
- https://github.com/shaunsingh/moonlight.nvim -- purple-ish goodness

## Languages

### Yaml / k8s
- https://github.com/phelipetls/jsonpath.nvim *for yaml? also*
- https://github.com/b0o/SchemaStore.nvim

### debug
- https://github.com/mfussenegger/nvim-dap
- https://github.com/theHamsta/nvim-dap-virtual-text

### Lint
- https://github.com/mfussenegger/nvim-lint

### Formatting
- https://github.com/mhartington/formatter.nvim (?maybe)
- https://github.com/nvimdev/guard.nvim
- https://github.com/stevearc/conform.nvim *lazyvim*
- https://github.com/niuiic/format.nvim
- https://github.com/lukas-reineke/lsp-format.nvim

## Git
- https://github.com/NeogitOrg/neogit
- https://github.com/linrongbin16/gitlinker.nvim
- https://github.com/lewis6991/gitsigns.nvim

## AI
- https://github.com/zbirenbaum/copilot-cmp
