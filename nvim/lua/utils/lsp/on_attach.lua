local utils = require('utils');
local wk = require('whichkey_setup')
local lsp_status = require('lsp-status')

local on_attach = function(client, bufnr)
    lsp_status.on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.g.nvim_tree_lsp_diagnostics = 1

    -- Mappings.
    local opts = {noremap = true, silent = true}
    utils.buf_set_keymap(bufnr, 'n', opts, {
        {'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>'},
        -- {'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>'},
        {'gd', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>"},
        -- {'K', '<Cmd>lua vim.lsp.buf.hover()<CR>'},
        {'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>"},
        {
            "<C-f>",
            "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>"
        },
        {
            "<C-b>",
            "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>"
        }, {'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>'},
        -- {'<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>'},
        {
            '<C-k>',
            "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>"
        },
        {'gs', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>"},
        -- {'[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'},
        {
            '[d',
            "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>"
        }, -- {']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>'},
        {
            ']d',
            "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>"
        }, {'gr', '<cmd>lua vim.lsp.buf.references()<CR>'}
    });

    -- whichkey
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
            l = {'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', 'loc list'},
            ["?"] = {'<cmd>LspTroubleDocumentToggle<CR>', 'currenet troubles'},
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
    if client.resolved_capabilities.document_formatting then
        keymap['r']['='] = {"<cmd>lua vim.lsp.buf.formatting()<CR>", 'format'}
    end
    if client.resolved_capabilities.document_range_formatting then
        visual_keymap['r']['='] = {
            "<cmd>lua vim.lsp.buf.range_formatting()<CR>", 'format'
        }
    end

    wk.register_keymap('localleader', keymap, {
        noremap = true,
        silent = true,
        mode = 'n',
        bufnr = bufnr
    })

    wk.register_keymap('localleader', visual_keymap, {
        noremap = true,
        silent = true,
        mode = 'v',
        bufnr = bufnr
    })

    -- vim.api.nvim_exec([[
    --   autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()
    --   autocmd CursorHoldI <buffer> silent! lua vim.lsp.buf.signature_help()
    -- ]], false)

    vim.api.nvim_command [[
        autocmd CursorHold,CursorHoldI * :lua require('lspsaga.signaturehelp').signature_help()
    ]]

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
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
