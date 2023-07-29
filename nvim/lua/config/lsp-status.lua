local lsp_status = require('lsp-status')
lsp_status.register_progress()
lsp_status.config({
    status_symbol = '✔',
    diagnostics = false,
    indicator_errors = 'e',
    indicator_warnings = 'w',
    indicator_info = 'i',
    indicator_hint = 'h',
    indicator_ok = '✔',
    spinner_frames = {'⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷'}
})
