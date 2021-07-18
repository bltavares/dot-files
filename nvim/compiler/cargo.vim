if exists("current_compiler")
  finish
endif
let current_compiler = "cargo"

let s:cpo_save = &cpo
set cpo&vim

" New errorformat (after nightly 2016/08/10)
CompilerSet errorformat=
      \%-G,
      \%-Gerror:\ aborting\ %.%#,
      \%-Gerror:\ Could\ not\ compile\ %.%#,
      \%Eerror:\ %m,
      \%Eerror[E%n]:\ %m,
      \%Wwarning:\ %m,
      \%Inote:\ %m,
      \%C\ %#-->\ %f:%l:%c,
      \%E\ \ left:%m,%C\ right:%m\ %f:%l:%c,%Z
"
" Ignore general cargo progress messages
CompilerSet errorformat+=
      \%-G%\\s%#Downloading%.%#,
      \%-G%\\s%#Compiling%.%#,
      \%-G%\\s%#Finished%.%#,
      \%-G%\\s%#error:\ Could\ not\ compile\ %.%#,
      \%-G%\\s%#To\ learn\ more\\,%.%#,
      \%-Gnote:\ Run\ with\ \`RUST_BACKTRACE=%.%#,
      \%.%#panicked\ at\ \\'%m\\'\\,\ %f:%l:%c

CompilerSet makeprg=cargo\ $*

let &cpo = s:cpo_save
unlet s:cpo_save
