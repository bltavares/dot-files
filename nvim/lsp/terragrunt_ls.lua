---@type vim.lsp.Config
return {
  cmd = { 'terragrunt-ls' },
  filetypes = { 'hcl' },
  root_markers = { '.terragrunt-cache', '.git' },
}
