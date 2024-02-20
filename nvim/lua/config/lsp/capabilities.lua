local cmp_nvim_lsp = require('cmp_nvim_lsp');

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {prefix = " » "},
        underline = true,
        signs = true,
        update_in_insert = true
    })

local create = function()
    local capabilities = cmp_nvim_lsp.default_capabilities()
    return capabilities
end

return {create = create}
