# neovim

Requires 0.12

- Using `lazy` for package management
  - Not using neovim native pack as lazy loading is not present
- Using `snacks.picker` for fuzzy-finding and navigation
- Using [which-key](https://github.com/folke/which-key.nvim) bound to `<SPC>` and `,` just like spacemacs
- Cross-platform support (w/ [neovide](https://github.com/Kethku/neovide) vfx) with **strong** preferene to vim/lua-only plugins
  - No node/python plugins allowed

To install the dependencies:

```sh
nvim --headless "+Lazy! sync" +qa
```

## Languages

The following dependencies are needed for propper language support.
Use `mise` for easy setup.

### Clojure

- [clojure-lsp](https://github.com/clojure-lsp/clojure-lsp)

### Lua

- [lua-language-server](https://github.com/sumneko/lua-language-server/)
- stylua

### Flutter

- `flutter`

### Markdown

- Optional: [glow](https://github.com/charmbracelet/glow) for preview

### Rust 

- [rust-analyzer](https://github.com/rust-analyzer/rust-analyzer)
