OS=`uname -s`
if [[ "Darwin" == "$OS" ]]; then
  MD5="md5"
else
  MD5="md5sum"
fi

host_num=$((0x`hostname | $MD5    | cut -c1-8` % 216 + 1))
user_num=$((0x`whoami   | $MD5   | cut -c1-8` % 216 + 1))

PROMPT='[%{$fg_bold[red]%}%t%{$reset_color%}][%{$fg_bold[magenta]%}%n@%m %{${FG[$user_num]}%}~%{${FG[$host_num]}%}> %{$fg_bold[cyan]%}%~%{$reset_color%}]%# %{$fg_bold[blue]%}$(__git_ps1 "(%s) " | sed "s/%/%%/g" )%{$reset_color%}'
RPROMPT="$(battery_time_remaining | sed -e 's/no battery//')"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
