#!/bin/bash

## Setup global host config
export HOST="$(hostname | tr '[:upper:]' '[:lower:]')"
export MISE_SYSTEM_CONFIG_DIR="${HOME}/.config/mise/hosts/${HOST}"
if [[ -z "$X_MISE_GLOBAL" && -d "$MISE_SYSTEM_CONFIG_DIR" ]]; then
  which mise > /dev/null && \
    X_MISE_GLOBAL=on exec mise en
fi

x() {
  if [[ $# -eq 0 ]]; then
    local local_mise="$(mise cfg ls --silent --no-header | grep -v "~/.config/mise" | wc -l )"
    printf "Available envs:\n\n"
    if [[ "$local_mise" -gt 0 ]]; then
      echo "(local)"
    fi
    for f in ~/.config/mise/mise.*.toml; do
      basename "${f//mise./}" .toml
    done
    return
  fi

  if [[ -z "$MISE_ENV" ]]; then
    declare -a MISE_ENV=( "$@" )
  else
    IFS="," read -r -A MISE_ENV <<<"$MISE_ENV"
    MISE_ENV+=( "$@" )
  fi

  MISE_ENV="${MISE_ENV[*]// /,}" MISE_SHELL=zsh mise en
}

xo() {
  if [[ $# -eq 0 ]]; then
    printf "Available envs:\n\n"
    for f in ~/.config/mise/mise.*.toml; do
      basename "${f//mise./}" .toml
    done
    return
  fi

  cp ~/.config/mise/mise.$1.toml mise.local.toml
}

