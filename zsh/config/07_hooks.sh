if which direnv &>/dev/null; then
  # https://github.com/direnv/direnv/issues/68
  export DIRENV_LOG_FORMAT=
  # export DIRENV_LOG_FORMAT=$'\033[2mdirenv: %s\033[0m'
  eval "$(direnv hook zsh)"
fi

if which atuin &>/dev/null; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi

if which zoxide &>/dev/null; then
  eval "$(zoxide init zsh --cmd cd)"
fi

if [[ -f "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi

if which eza &>/dev/null; then
  alias ls='eza'
fi

if which mmake &>/dev/null; then
  alias make='mmake'
fi
