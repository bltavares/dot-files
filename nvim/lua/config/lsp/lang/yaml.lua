local on_attach = require("config.lsp.on_attach")
local capabilities = require("config.lsp.capabilities").create()
local wk = require('which-key')

local cfg = require("yaml-companion").setup({
  lspconfig = {
    settings = {
      yaml = {
        validate = true,
        schemaStore = {
          enable = false,
          url = "",
        },
        schemas = {
          -- Istio
          ['https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/extensions.istio.io/wasmplugin_v1alpha1.json'] =
          "*.{yml,yaml}",
          -- Kubernetes
          ['https://json.schemastore.org/kustomization.json'] = 'kustomization.{yml,yaml}',
          ["kubernetes"] =
          "*.{yml,yaml}",

          -- Docker
          ['https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json'] =
          'docker-compose*.{yml,yaml}',
          -- GitHub Actions
          ['https://json.schemastore.org/github-workflow.json'] = '.github/workflows/*.{yml,yaml}',
        },
      },
    },
    capabilities = require("config.lsp.capabilities").create(),
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)

      local keymap = {
        f = {
          name = "+file",
          s = { "<cmd>Telescope yaml_schema<cr>", "schema" },
          c = { "<cmd>lua=YamlSchema()<cr>", "current" },
        }
      }
      wk.register(keymap, {
        prefix = '<localleader>',
        silent = true,
        noremap = true,
        mode = 'n',
        buffer = bufnr
      })
    end
  },
})

_G.YamlSchema = function()
  local schema = require("yaml-companion").get_buf_schema(0)
  if schema.result[1].name == "none" then
    return ""
  end
  local name = schema.result[1].name
  -- vim.fn.setreg("+", name) -- copy to clipboard
  return name
end


require("lspconfig")["yamlls"].setup(cfg)
