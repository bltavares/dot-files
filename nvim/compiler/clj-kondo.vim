if exists("current_compiler")
  finish
endif
let current_compiler="clj-kondo"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=%f:%l:%c:\ Parse\ %t%*[^:]:\ %m,%f:%l:%c:\ %t%*[^:]:\ %m
CompilerSet makeprg=clj-kondo\ --lint\ %
