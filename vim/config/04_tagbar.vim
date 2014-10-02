"Tagbar
nnoremap <leader>n :TagbarToggle<cr>
let g:tagbar_type_ruby = {
      \ 'kinds' : [
      \ 'm:modules',
      \ 'c:classes',
      \ 'd:describes',
      \ 'C:contexts',
      \ 'f:methods',
      \ 'F:singleton methods'
      \ ]
      \ }
let g:tagbar_type_clojure = {
      \ 'ctagstype': 'clojure',
      \ 'kinds' : [
      \ 'n:namespace' ,
      \ 'd:definition' ,
      \ 'f:function' ,
      \ 'm:macro' ,
      \ 'i:inline' ,
      \ 'a:multimethod definition' ,
      \ 'b:multimethod implementation' ,
      \ 'c:defonce' ,
      \ 's:struct' ,
      \ 'v:intern' ,
      \]
      \ }
let g:tagbar_type_puppet = {
      \ 'ctagstype': 'puppet',
      \ 'kinds': [
      \'c:class',
      \'s:site',
      \'n:node',
      \'d:definition'
      \]
      \}
let g:tagbar_type_markdown = {
      \ 'ctagstype' : 'markdown',
      \ 'kinds' : [
      \ 'h:Heading_L1',
      \ 'i:Heading_L2',
      \ 'k:Heading_L3'
      \ ]
      \ }
