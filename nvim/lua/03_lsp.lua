local lsp_status = require('lsp-status')
lsp_status.register_progress()

lsp_status.config({
    status_symbol = '',
    indicator_errors = 'e',
    indicator_warnings = 'w',
    indicator_info = 'i',
    indicator_hint = 'h',
    indicator_ok = '✔',
    spinner_frames = {'⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷'}
})

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {prefix = " » "},
        underline = true,
        signs = true,
        update_in_insert = true
    })

require'lspsaga'.init_lsp_saga {
    error_sign = '•e',
    warn_sign = '•w',
    hint_sign = '•h',
    infor_sign = '•i',
    code_action_icon = '?',
    dianostic_header_icon = '»',
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true
    },
    code_action_keys = {quit = '<esc>', exec = '<CR>'},
    finder_definition_icon = '•d',
    finder_reference_icon = '•r',
    finder_action_keys = {
        open = 'o',
        vsplit = 's',
        split = 'i',
        quit = '<esc>',
        scroll_down = '<C-n>',
        scroll_up = '<C-p>'
    }
}