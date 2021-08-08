local lsp_status = require('lsp-status');

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {prefix = " » "},
        underline = true,
        signs = true,
        update_in_insert = true
    })

local create = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return vim.tbl_extend('keep', capabilities, lsp_status.capabilities);
end

return {create = create}
