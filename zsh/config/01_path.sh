export PATH="$HOME/bin:$HOME/.cask/bin:$PATH"

if [[ -e /home/linuxbrew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
