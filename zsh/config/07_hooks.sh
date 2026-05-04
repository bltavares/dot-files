#!/bin/bash

if which atuin &>/dev/null; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi

if which zoxide &>/dev/null; then
  eval "$(zoxide init zsh --cmd cd)"
fi

if [[ -f "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi
