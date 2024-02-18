local wk = require('which-key')
local lsp_status = require('lsp-status')

local on_attach = function(client, bufnr)
    lsp_status.on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.lsp.inlay_hint(bufnr, true)

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
            "<cmd>Lspsaga hover_doc<CR>",
            "show docs"
        },
        ['<C-k>'] = {
            "<cmd>lua vim.lsp.buf.signature_help()<CR>",
            "signature help"
        },
        -- buggy and does not combine with hovering info
        -- ['gs'] = "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>" ,
        ['gs'] = {
            "<cmd>lua vim.lsp.buf.signature_help()<CR>",
            "preview definition"
        },
        -- ['[d'] = '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
        ['[d'] = {
            "<cmd>Lspsaga diagnostic_jump_prev<CR>",
            "previous diagnostic"
        },
        [']d'] = {
            "<cmd>Lspsaga diagnostic_jump_next<CR>",
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
                "<cmd>Lspsaga lsp_finder<CR>",
                'find reference'
            },
            -- r = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'rename'},
            r = {"<cmd>Lspsaga rename<CR>", 'rename'},
            -- a = {'<cmd>lua vim.lsp.buf.code_actions()<CR>', 'action'},
            a = {
                "<cmd>Lspsaga code_action<CR>",
                'action'
            },
            -- e = {
            --     '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
            --     'line diagnostic'
            -- },
            e = {
                "<cmd>Lspsaga show_line_diagnostics<CR>",
                'line diagnostic'
            },
            E = {
                "<cmd>Lspsaga show_cursor_diagnostics<CR>",
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
                "<cmd>Lspsaga code_action<CR>",
                "action"
            }
        }
    }

    -- Set some keybinds conditional on server capabilities
    if client.server_capabilities.documentFormattingProvider then
        keymap['r']['='] = {"<cmd>lua vim.lsp.buf.format { async = true }<CR>", 'format'}
    end
    if client.server_capabilities.documentRangeFormattingProvider then
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

    -- Shows documentation on cursor movement 
    -- (noisy and does not integrate with document_highlight)
    -- vim.api.nvim_command [[
    --     autocmd CursorHold,CursorHoldI * :lua vim.lsp.buf.signature_help()
    -- ]]

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_command [[
    hi LspReferenceRead  cterm=bold ctermbg=red gui=bold guifg=LightYellow
    hi LspReferenceWrite cterm=bold ctermbg=red gui=bold guifg=red
    hi LspReferenceText  cterm=underline gui=underline
    ]]

        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Clear All the References",
        })
    end
end

return on_attach;
