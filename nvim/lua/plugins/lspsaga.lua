require'lspsaga'.init_lsp_saga {
    -- diagnostic_header_icon = '»',
    -- error, warn, info, hint
    diagnostic_header = { '•e', '•w', '•i', '•h', },
    code_action_icon = '?',
    code_action_lightbulb = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
    },
    code_action_keys = {quit = '<esc>', exec = '<CR>'},
    finder_icons = {
        def = '•d',
        ref = '•r',
        link = '•l',
    },
    finder_action_keys = {
        open = 'o',
        vsplit = 's',
        split = 'i',
        quit = '<esc>',
        scroll_down = '<C-n>',
        scroll_up = '<C-p>'
    }
}
