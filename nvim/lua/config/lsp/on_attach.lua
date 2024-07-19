local wk = require("which-key")

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end

  wk.add({
    { buffer = bufnr, remap = false },
    {
      { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "signature help" },
      { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "show docs" },
      { "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "previous diagnostic" },
      { "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "next diagnostic" },
      { "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", desc = "goto declaration" },
      { "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", desc = "goto definition" },
      { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "goto iplementations" },
      { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "goto references" },
      { "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "preview definition" },
    },
    {
      { "<localleader>p", group = "project" },
      { "<localleader>pa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", desc = "add workspace" },
      { "<localleader>pl", "<cmd>lua vim.lsp.buf.list_workspace_folders()<CR>", desc = "list workspace" },
      { "<localleader>pr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", desc = "remove workspace" },
    },
    {
      { "<localleader>r", group = "refactor" },
      {
        "<localleader>r=",
        "<cmd>lua vim.lsp.buf.format { async = true }<CR>",
        desc = "format",
        cond = client.server_capabilities.documentFormattingProvider,
      },
      { "<localleader>r?", "<cmd>Trouble document_diagnostics<CR>", desc = "current troubles" },
      { "<localleader>rE", "<cmd>Lspsaga show_cursor_diagnostics<CR>", desc = "current diagnostic" },
      { "<localleader>rL", "<cmd>lua vim.diagnostic.setloclist({workspace = true})<CR>", desc = "workspace list" },
      { "<localleader>ra", "<cmd>Lspsaga code_action<CR>", desc = "action" },
      { "<localleader>rd", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "type definitions" },
      { "<localleader>re", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "line diagnostic" },
      { "<localleader>rh", "<cmd>Lspsaga lsp_finder<CR>", desc = "find reference" },
      { "<localleader>rl", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "loc list" },
      { "<localleader>ro", "<cmd>SymbolsOutline<CR>", desc = "outline" },
      { "<localleader>rr", "<cmd>Lspsaga rename<CR>", desc = "rename" },
    },

    {
      { mode = { "v" }, buffer = bufnr, remap = false },
      { "<localleader>r", group = "refactor" },
      {
        "<localleader>r=",
        "<cmd>lua vim.lsp.buf.range_formatting()<CR>",
        desc = "format",
        cond = client.server_capabilities.documentRangeFormattingProvider,
      },
      { "<localleader>ra", "<cmd>Lspsaga code_action<CR>", desc = "action" },
    },
  })

  -- Shows documentation on cursor movement
  -- (noisy and does not integrate with document_highlight)
  -- vim.api.nvim_command [[
  --     autocmd CursorHold,CursorHoldI * :lua vim.lsp.buf.signature_help()
  -- ]]
end

return on_attach
