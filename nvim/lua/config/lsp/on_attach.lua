local wk = require("which-key")

local on_attach = function(client, bufnr)
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end

  wk.add({
    buffer = bufnr,
    remap = false,
    {
      { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "signature help" },
      { "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "show docs" },
      -- builtin
      -- { "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", desc = "previous diagnostic" },
      -- { "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "next diagnostic" },
      { "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", desc = "goto declaration" },
      { "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", desc = "goto definition" },
      { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "goto iplementations" },
      { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "goto references" },
      { "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "preview definition" },
    },
    {
      { "<localleader>w", group = "workspace" },
      { "<localleader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", desc = "add LSP workspace" },
      { "<localleader>wl", "<cmd>lua= vim.lsp.buf.list_workspace_folders()<CR>", desc = "list LSP workspace" },
      { "<localleader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", desc = "remove LSP workspace" },
    },
    {
      { "<localleader>r", group = "refactor" },
      {
        "<localleader>r=",
        "<cmd>lua vim.lsp.buf.format { async = true }<CR>",
        desc = "format",
        cond = client.server_capabilities.documentFormattingProvider,
      },
      { "<localleader>r?", "<cmd>Trouble diagnostics <CR>", desc = "current troubles" },
      { "<localleader>rE", "<cmd>Trouble diagnostics open filter.buf=0<CR>", desc = "buf diagnostic" },
      {
        "<localleader>rL",
        "<cmd>lua vim.diagnostic.setloclist({workspace = true})<CR>",
        desc = "workspace diagnostics loc list",
      },
      --{ "<localleader>ra", "<cmd>lua vim.lsp.buf.code_action()<CR>",     desc = "action" },
      { "<localleader>ra", "<cmd>lua require('tiny-code-action').code_action()<CR>", desc = "action" },
      { "<localleader>rd", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "type definitions" },
      { "<localleader>re", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "line diagnostic" },
      { "<localleader>rh", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "find reference" },
      {
        "<localleader>rl",
        "<cmd>lua vim.diagnostic.setloclist()<CR>",
        desc = "diagnostics loc list",
      },
      { "<localleader>ro", "<cmd>Outline<CR>", desc = "outline" },
      { "<localleader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "rename" },
    },
  })

  wk.add({
    mode = { "v" },
    buffer = bufnr,
    remap = false,
    { "<localleader>r", group = "refactor" },
    {
      "<localleader>r=",
      "gq",
      desc = "format",
      cond = client.server_capabilities.documentRangeFormattingProvider,
    },
    -- { "<localleader>ra", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "action" },
    { "<localleader>ra", "<cmd>lua require('tiny-code-action').code_action()<CR>", desc = "action" },
  })

  -- Shows documentation on cursor movement
  -- (noisy and does not integrate with document_highlight)
  -- vim.api.nvim_command [[
  --     autocmd CursorHold,CursorHoldI * :lua vim.lsp.buf.signature_help()
  -- ]]
end

return on_attach
