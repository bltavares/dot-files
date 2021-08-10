# neovim

- Using [packer](https://github.com/wbthomason/packer.nvim) for lazy-loading & plugin management
- Using [telescope](https://github.com/nvim-telescope/telescope.nvim) for fuzzy-finding and navigation
- Using [which-key](https://github.com/folke/which-key.nvim) bound to `<SPC>` and `,` just like spacemacs
  - Mode bindings are only mapped if lsp is working (lazy-loading)
- Using neovim 0.5 native LSP & treesitter for everything
- Cross-platform support (w/ [neovide](https://github.com/Kethku/neovide) vfx) with **strong** preferene to vim/lua-only plugins
  - No node/python plugins allowed

To install the dependencies:

```sh
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

## Languages

The following dependenceis are needed for propper language support:

### Clojure

- [clojure-lsp](https://github.com/clojure-lsp/clojure-lsp)

### Lua

- [lua-language-server](https://github.com/sumneko/lua-language-server/)
- TODO: formatting support

### Flutter

- `flutter`

### Markdown

- Optional: [glow](https://github.com/charmbracelet/glow) for preview

### Rust 

- [rust-analyzer](https://github.com/rust-analyzer/rust-analyzer)

