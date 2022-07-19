local wk = require('which-key')
local lsp_status = require('lsp-status')

local on_attach = function(client, bufnr)
    lsp_status.on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {mode = "n", noremap = true, silent = true, buffer = bufnr}
    wk.register({
        ['gD'] = {'<Cmd>lua vim.lsp.buf.declaration()<CR>', "goto declaration"},
        ['gd'] = {'<Cmd>lua vim.lsp.buf.definition()<CR>', "goto definition"},
        ['gi'] = {
            '<cmd>lua vim.lsp.buf.implementation()<CR>', "goto iplementations"
        },
        ['gr'] = {'<cmd>lua vim.lsp.buf.references()<CR>', "goto references"},
        -- ['K'] = '<Cmd>lua vim.lsp.buf.hover()<CR>',
        ['K'] = {
            "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>",
            "show docs"
        },
        -- ['<C-k>'] = '<cmd>lua vim.lsp.buf.signature_help()<CR>',,
        ['<C-k>'] = {
            "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>",
            "signature help"
        },
        ["<C-f>"] = {
            "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
            "scroll action down"
        },
        ["<C-b>"] = {
            "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
            "scroll action up"
        },
        -- buggy and does not combine with hovering info
        -- ['gs'] = "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>" ,
        ['gs'] = {
            "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>",
            "preview definition"
        },
        -- ['[d'] = '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
        ['[d'] = {
            "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>",
            "previous diagnostic"
        },
        [']d'] = {
            "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>",
            "next diagnostic"
        }
    }, opts);

    local keymap = {
        p = {
            name = "+project",
            a = {
                '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
                'add workspace'
            },
            r = {
                '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
                'remove workspace'
            },
            l = {
                '<cmd>lua vim.lsp.buf.list_workspace_folders()<CR>',
                'list workspace'
            }
        },
        r = {
            name = '+refactor',
            d = {
                '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'type definitions'
            },
            h = {
                "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>",
                'find reference'
            },
            -- r = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'rename'},
            r = {"<cmd>lua require('lspsaga.rename').rename()<CR>", 'rename'},
            -- a = {'<cmd>lua vim.lsp.buf.code_actions()<CR>', 'action'},
            a = {
                "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
                'action'
            },
            -- e = {
            --     '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
            --     'line diagnostic'
            -- },
            e = {
                "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>",
                'line diagnostic'
            },
            E = {
                "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>",
                "current diagnostic"
            },
            l = {'<cmd>lua vim.diagnostic.setloclist()<CR>', 'loc list'},
            L = {
                '<cmd>lua vim.diagnostic.setloclist({workspace = true})<CR>',
                'workspace list'
            },
            o = {'<cmd>SymbolsOutline<CR>', 'outline'},
            ["?"] = {'<cmd>Trouble document_diagnostics<CR>', 'current troubles'}
        }
    }

    local visual_keymap = {
        r = {
            name = "+refactor",
            a = {
                "<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>",
                "action"
            }
        }
    }

    -- Set some keybinds conditional on server capabilities
    if client.server_capabilities.documentFormatting then
        keymap['r']['='] = {"<cmd>lua vim.lsp.buf.format { async = true }<CR>", 'format'}
    end
    if client.server_capabilities.documentRangeFormatting then
        visual_keymap['r']['='] = {
            "<cmd>lua vim.lsp.buf.range_formatting()<CR>", 'format'
        }
    end

    wk.register(keymap, {
        prefix = '<localleader>',
        noremap = true,
        silent = true,
        mode = 'n',
        buffer = bufnr
    })

    wk.register(visual_keymap, {
        prefix = '<localleader>',
        noremap = true,
        silent = true,
        mode = 'v',
        buffer = bufnr
    })

    -- vim.api.nvim_exec([[
    --   autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()
    --   autocmd CursorHoldI <buffer> silent! lua vim.lsp.buf.signature_help()
    -- ]], false)

    -- does not play well with other lsp
    -- vim.api.nvim_command [[
    --     autocmd CursorHold,CursorHoldI * :lua require('lspsaga.signaturehelp').signature_help()
    -- ]]

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlight then
        vim.api.nvim_command [[
    hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
    hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
    hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
      ]]
    end
end

return on_attach;
