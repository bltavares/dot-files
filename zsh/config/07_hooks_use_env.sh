# Custom cd hook to allow globally seeting environments using nix
# As direnv does not support globally defined commands
#
# It will attempt to load the environment using 'use-env', only if direnv or a nix env is already set
_use_env_hook() {
  if [[ ! -f .envrc && -z "$name" ]]; then
  trap -- '' SIGINT;
  use-env
  trap - SIGINT;
  fi
}
typeset -ag precmd_functions;
if [[ -z "${precmd_functions[(r)_use_env_hook]+1}" ]]; then
  precmd_functions=( _use_env_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z "${chpwd_functions[(r)_use_env_hook]+1}" ]]; then
  chpwd_functions=( _use_env_hook ${chpwd_functions[@]} )
fi
