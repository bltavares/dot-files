#!/bin/bash -xe

curr_dir=`pwd`

linking() {
  rm -fr $2 2>/dev/null || true
  ln -s $1 $2
}

install.vim() {
  mkdir -p vim/autoload
  curl -fLo vim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  linking $curr_dir/vim $HOME/.vim
  linking $curr_dir/vim/vimrc $HOME/.vimrc
}

install.emacs() {
  [[ -d $HOME/.cask ]] || git clone https://github.com/cask/cask.git $HOME/.cask
  linking $curr_dir/emacs.d $HOME/.emacs.d

  [[ -d $HOME/.emacs.d.spacemacs ]] || git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d.spacemacs
  linking $curr_dir/spacemacs.d $HOME/.spacemacs.d
}

install.mutt() {
  linking $curr_dir/mutt $HOME/.mutt
  linking $curr_dir/muttrc $HOME/.muttrc
}

install.confs() {
  linking $curr_dir/gitignore_global $HOME/.gitignore_global
  linking $curr_dir/tmux.conf $HOME/.tmux.conf
  linking $curr_dir/tmux-osx.conf $HOME/.tmux-osx.conf
  linking $curr_dir/ctags $HOME/.ctags
  linking $curr_dir/blogalrc $HOME/.globalrc

  mkdir -p $HOME/.config
  linking $curr_dir/awesome $HOME/.config/awesome
}

install.zsh() {
  [[ -d $HOME/.oh-my-zsh ]] || git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
  curl -fLo $HOME/.git_prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  linking $curr_dir/zsh $HOME/.zsh
  linking $curr_dir/zsh/zshrc $HOME/.zshrc
}

install.bins() {
  mkdir -p $HOME/bin
  for b in $curr_dir/bin/*; do
    linking $b $HOME/bin/`basename $b`
  done
}

install.weechat() {
  linking $curr_dir/weechat $HOME/.weechat
}

#OS=`uname -s`
#if [[ "$OS" != "Darwin" ]]; then
  #cd $HOME
  #curl -L https://gist.github.com/bltavares/2706792/raw/post-install.sh | bash
#fi

install.all() {
  install.bins
  install.emacs
  install.vim
  install.confs
  install.zsh
  install.mutt
  install.weechat
}

options=("bins" "emacs" "vim" "confs" "zsh" "mutt" "weechat" "all")
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
