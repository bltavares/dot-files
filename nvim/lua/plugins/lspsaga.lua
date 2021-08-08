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
