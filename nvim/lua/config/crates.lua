require("crates").setup {
    null_ls = {
        enabled = true,
        name = "crates.nvim",
    },
    src = {
        cmp = {
            enabled = true
        },
    },
    on_attach = function(bufnr)
        require("cmp").setup.buffer({ sources = { { name = "crates" } } });
    end
}
