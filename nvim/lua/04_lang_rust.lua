local on_attach = require('utils.lsp.on_attach');

local capabilities = require('utils.lsp.capabilities').create()
local rust_analyzer = {
    server = {capabilities = capabilities, on_attach = on_attach}
}
require('rust-tools').setup(rust_analyzer)

local inlay_hints = require('lsp_extensions.inlay_hints')

-- Global function, so you can just call it on the lua side
ShowInlineInlayHints = function()
    vim.lsp.buf_request(0, 'rust-analyzer/inlayHints', inlay_hints.get_params(),
                        inlay_hints.get_callback {
        highlight = "Comment",
        prefix = " » ",
        aligned = true,
        only_current_line = false,
        enabled = {"ChainingHint"}
    })
end

vim.api.nvim_command [[
    autocmd BufRead Cargo.toml call crates#toggle()

    augroup ShowLineHints
      au!
      autocmd CursorHold,CursorHoldI,CursorMoved *.rs :lua ShowInlineInlayHints()
    augroup END
]]
