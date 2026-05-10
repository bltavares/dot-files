local cmp_nvim_lsp = require("cmp_nvim_lsp")

local create = function()
  local capabilities = cmp_nvim_lsp.default_capabilities()
  return capabilities
end

return { create = create }
