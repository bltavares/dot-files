PROMPT='[%{$fg_bold[red]%}%t%{$reset_color%}][%{$fg_bold[magenta]%}%n@%m ~> %{$fg_bold[cyan]%}%~%{$reset_color%}]%# %{$fg_bold[blue]%}$(__git_ps1 "(%s) " | sed "s/%/%%/g" )%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
