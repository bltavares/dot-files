if exists("current_compiler")
  finish
endif
let current_compiler = "flutter"

let s:cpo_save = &cpo
set cpo&vim

CompilerSet errorformat =
      \\ %#%m\ %#file:/%#%f:%l:%c,
      \%E\ %#file:/%#%f\ line\ %l,
      \%-C\ %#The\ test\ description\ was:,
      \%Z\ %#%m,
      \%.%#\ %f:%l:%c:\ %t%.%#:\ %#%m,

CompilerSet makeprg=flutter\ test

let &cpo = s:cpo_save
unlet s:cpo_save
