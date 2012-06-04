function unset_git_status() {
if [[ -a "$HOME/.no_git_ps1" ]]; then
  local forget_paths="$(cat ~/.no_git_ps1)"
  local reset_git="$( pwd | grep "$forget_paths")"
  if [ "$reset_git" != "" ]; then
    NO_GIT_PS1=bla
  elif [ "$NO_GIT_PS1" != "" ]; then
    unset NO_GIT_PS1
  fi
fi
}
chpwd_functions+=(unset_git_status)

