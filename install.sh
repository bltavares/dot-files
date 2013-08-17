#!/bin/bash

#Initialize submodules
git submodule init; git submodule update;

curr_dir=`pwd`


#Set up vim
[[ -d $HOME/.vim ]] && mv $HOME/.vim $HOME/.vim-bkp 
ln -s $curr_dir/vim $HOME/.vim

[[ -f $HOME/.vimrc ]] && mv $HOME/.vimrc $HOME/.vimrc-bkp
ln -s $HOME/.vim/vimrc $HOME/.vimrc

#Set up emacs
[[ -d $HOME/.emacs.d ]] && mv $HOME/.emacs.d $HOME/.emacs.d.bkp
ln -s $curr_dir/emacs.d $HOME/.emacs.d

[[ -d $HOME/.gitignore_global ]] && mv $HOME/.gitignore_global $HOME/.gitignore_global.bkp
ln -s $curr_dir/gitignore_global $HOME/.gitignore_global

#gnome-terminal
which gconftool-2 && gconftool-2 --load $curr_dir/gnome-terminal/config.xml 

#tmux
[[ -f $HOME/.tmux.conf ]] && mv $HOME/.tmux.conf $HOME/.tmux.conf-bkp
ln -s $curr_dir/tmux.conf $HOME/.tmux.conf

#ctags
[[ -f $HOME/.ctags ]] && mv $HOME/.ctags $HOME/.ctags-bkp
ln -s $curr_dir/ctags $HOME/.ctags

#Zshell
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
mv $HOME/.oh-my-zsh/custom $HOME/.oh-my-zsh/custom-bkp
mv $HOME/.zshrc $HOME/.zshrc-bkp
ln -s $curr_dir/zsh/zshrc $HOME/.zshrc
ln -s $curr_dir/zsh/oh-my-zsh/custom $HOME/.oh-my-zsh/custom

#Awesome
mkdir -p $HOME/.config
[[ -d $HOME/.config/awesome ]] && mv $HOME/.config/awesome $HOME/.config/awesome-bkp 
ln -s $curr_dir/awesome $HOME/.config/awesome

#Custom commands
mkdir -p $HOME/bin
for b in $curr_dir/bin/*; do
  ln -s $b $HOME/bin/`basename $b`
done

OS=`uname -s`
if [[ "$OS" != "Darwin" ]]; then
  cd $HOME
  curl -L https://gist.github.com/bltavares/2706792/raw/post-install.sh | bash
fi


touch $HOME/.baseline_dotfiles
