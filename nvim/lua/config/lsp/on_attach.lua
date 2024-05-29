local wk = require("which-key")

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end

  -- Mappings.
  local opts = { mode = "n", noremap = true, silent = true, buffer = bufnr }
  wk.register({
    ["gD"] = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "goto declaration" },
    ["gd"] = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "goto definition" },
    ["gi"] = {
      "<cmd>lua vim.lsp.buf.implementation()<CR>",
      "goto iplementations",
    },
    ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "goto references" },
    -- ['K'] = '<Cmd>lua vim.lsp.buf.hover()<CR>',
    ["K"] = {
      "<cmd>Lspsaga hover_doc<CR>",
      "show docs",
    },
    ["<C-k>"] = {
      "<cmd>lua vim.lsp.buf.signature_help()<CR>",
      "signature help",
    },
    -- buggy and does not combine with hovering info
    -- ['gs'] = "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>" ,
    ["gs"] = {
      "<cmd>lua vim.lsp.buf.signature_help()<CR>",
      "preview definition",
    },
    -- ['[d'] = '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
    ["[d"] = {
      "<cmd>Lspsaga diagnostic_jump_prev<CR>",
      "previous diagnostic",
    },
    ["]d"] = {
      "<cmd>Lspsaga diagnostic_jump_next<CR>",
      "next diagnostic",
    },
  }, opts)

  local keymap = {
    p = {
      name = "+project",
      a = {
        "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
        "add workspace",
      },
      r = {
        "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
        "remove workspace",
      },
      l = {
        "<cmd>lua vim.lsp.buf.list_workspace_folders()<CR>",
        "list workspace",
      },
    },
    r = {
      name = "+refactor",
      d = {
        "<cmd>lua vim.lsp.buf.type_definition()<CR>",
        "type definitions",
      },
      h = {
        "<cmd>Lspsaga lsp_finder<CR>",
        "find reference",
      },
      -- r = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'rename'},
      r = { "<cmd>Lspsaga rename<CR>", "rename" },
      -- a = {'<cmd>lua vim.lsp.buf.code_actions()<CR>', 'action'},
      a = {
        "<cmd>Lspsaga code_action<CR>",
        "action",
      },
      -- e = {
      --     '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
      --     'line diagnostic'
      -- },
      e = {
        "<cmd>Lspsaga show_line_diagnostics<CR>",
        "line diagnostic",
      },
      E = {
        "<cmd>Lspsaga show_cursor_diagnostics<CR>",
        "current diagnostic",
      },
      l = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "loc list" },
      L = {
        "<cmd>lua vim.diagnostic.setloclist({workspace = true})<CR>",
        "workspace list",
      },
      o = { "<cmd>SymbolsOutline<CR>", "outline" },
      ["?"] = { "<cmd>Trouble document_diagnostics<CR>", "current troubles" },
    },
  }

  local visual_keymap = {
    r = {
      name = "+refactor",
      a = {
        "<cmd>Lspsaga code_action<CR>",
        "action",
      },
    },
  }

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.documentFormattingProvider then
    keymap["r"]["="] = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "format" }
  end
  if client.server_capabilities.documentRangeFormattingProvider then
    visual_keymap["r"]["="] = {
      "<cmd>lua vim.lsp.buf.range_formatting()<CR>",
      "format",
    }
  end

  wk.register(keymap, {
    prefix = "<localleader>",
    noremap = true,
    silent = true,
    mode = "n",
    buffer = bufnr,
  })

  wk.register(visual_keymap, {
    prefix = "<localleader>",
    noremap = true,
    silent = true,
    mode = "v",
    buffer = bufnr,
  })

  -- Shows documentation on cursor movement
  -- (noisy and does not integrate with document_highlight)
  -- vim.api.nvim_command [[
  --     autocmd CursorHold,CursorHoldI * :lua vim.lsp.buf.signature_help()
  -- ]]
end

return on_attach
