#!/bin/bash

## Set PS1
if which starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

## Make non-break character clear on paste
nbsp=$'\u00A0' # TODO: add this to starship.toml
bindkey -s $nbsp '^u'

## Move line up on terminal after submit
function preexec {
  if [[ -z "$NO_AUTOTOP" ]]; then
    tput cuu1
    tput el
    clear
    print -Pn $PS1
    print $1
  fi
}

function precmd {
  if [[ -z "$NO_AUTOTOP" ]]; then
    tput cup $(($(tput lines))) 0
  fi
}
