#!/bin/bash


x() {
  if [[ $# -eq 0 ]]; then
    local local_mise="$(mise cfg ls --silent --no-header | wc -l )"
    printf "Available envs:\n\n"
    if [[ "$local_mise" -gt 0 ]]; then
      echo "."
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
