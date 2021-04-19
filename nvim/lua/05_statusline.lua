-- set statusline+=\ %{FugitiveStatusline()}
vim.api.nvim_command [[
function! LspStatus() abort
    if luaeval('#vim.lsp.buf_get_clients() > 0')
        return luaeval("require('lsp-status').status()")
    endif
    return ''
endfunction

function TreeSitter() abort
    return luaeval("require('nvim-treesitter').statusline() or ''")
endfunction

set laststatus=2
set statusline=
set statusline+=%#LineNr#
set statusline+=%f
set statusline+=%m
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=%{FugitiveStatusline()}
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=%=
set statusline+=\ %{LspStatus()}
" set statusline+=%{TreeSitter()}
]]
