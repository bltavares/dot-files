#!/bin/bash -xe

curr_dir=`pwd`

linking() {
  rm -fr $2 2>/dev/null || true
  ln -s $1 $2
}

install.nvim() {
  mkdir -p $HOME/.config
  linking $curr_dir/nvim $HOME/.config/nvim
}

install.confs() {
  linking $curr_dir/gitignore_global $HOME/.gitignore_global
}

install.zsh() {
  [[ -d $HOME/.oh-my-zsh ]] || git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
  curl -fLo $HOME/.git_prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  linking $curr_dir/zsh $HOME/.zsh
  linking $curr_dir/zsh/zshrc $HOME/.zshrc
}

install.zellij() {
  mkdir -p $HOME/.config
  linking $curr_dir/zellij $HOME/.config/zellij
}

install.wezterm() {
  mkdir -p $HOME/.config
  linking $curr_dir/wezterm $HOME/.config/wezterm
}

install.bins() {
  mkdir -p $HOME/bin
  for b in $curr_dir/bin/*; do
    linking $b $HOME/bin/`basename $b`
  done
}

install.all() {
  install.bins
  install.confs
  install.zsh
  install.nvim
  install.zellij
  install.wezterm
}

options=("bins" "nvim" "confs" "zsh" "zellij" "wezterm" "all")
help() {
  echo "install.sh [option]"
  echo "[options] - one of the following:"
  for option in ${options[*]}; do
    echo " - $option"
  done
}

command=$1; shift
if [[ "${options[*]}" =~ "${command:-not-found}" ]]; then
 install.$command "$@"
else
 help
fi

touch $HOME/.baseline_dotfiles
