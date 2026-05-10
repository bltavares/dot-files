local cmp = require("blink.cmp")

local create = function()
  local capabilities = cmp.get_lsp_capabilities()
  return capabilities
end

return { create = create }
