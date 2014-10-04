OS=`uname -s`
if [[ "Darwin" == "$OS" ]]; then
  MD5="md5"
else
  MD5="md5sum"
fi

nbsp=$'\u00A0'
bindkey -s $nbsp '^u'

host_num=$((0x`hostname | $MD5 | cut -c1-8` % 216 + 1))
user_num=$((0x`whoami   | $MD5 | cut -c1-8` % 216 + 1))

setopt PROMPT_SUBST
PROMPT='%{$FG[$user_num]%}%n%{$FG[$host_num]%}@%m %{$fg_bold[cyan]%}%~%{$reset_color%} %#%{$fg_bold[blue]%}$(__git_ps1 " (%s)")%{$reset_color%}$nbsp'

function preexec {
  if [[ x$NO_AUTOTOP == "x" ]]; then
    tput cuu1; tput el; clear
    print -Pn $PS1; print $1
  fi
}

function precmd {
  if [[ x$NO_AUTOTOP == "x" ]]; then
    tput cup $(($(tput lines))) 0
  fi
}
