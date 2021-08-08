local lsp_status = require('lsp-status');
local LspStatus = function()
    if vim.lsp.buf_get_clients() > 0 then return lsp_status.status() end
    return ''
end

-- set statusline+=\ %{FugitiveStatusline()}
-- vim.api.nvim_command [[
-- function! LspStatus() abort
--     if luaeval('#vim.lsp.buf_get_clients() > 0')
--         return luaeval("require('lsp-status').status()")
--     endif
--     return ''
-- endfunction
--
-- function! TreeSitter() abort
--     return luaeval("require('nvim-treesitter').statusline() or ''")
-- endfunction
--
-- "set laststatus=2
-- "set statusline=
-- "set statusline+=%#LineNr#
-- "set statusline+=%f
-- "set statusline+=%m
-- "set statusline+=%#CursorColumn#
-- "set statusline+=\ %y
-- "set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
-- "set statusline+=\[%{&fileformat}\]
-- "set statusline+=%{FugitiveStatusline()}
-- "set statusline+=\ %p%%
-- "set statusline+=\ %l:%c
-- "set statusline+=%=
-- "set statusline+=\ %{LspStatus()}
-- "" set statusline+=%{TreeSitter()}
-- ]]

require('lualine').setup {
    options = {
        theme = 'tokyonight',
        icons_enabled = false,
        section_separators = '',
        component_separators = ''
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {{'filename', file_status = true}},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
}
