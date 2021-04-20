local lsp_status = require('lsp-status');

local create = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return vim.tbl_extend('keep', capabilities, lsp_status.capabilities);
end

return {create = create}
