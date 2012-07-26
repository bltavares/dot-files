#!/bin/bash

git submodule init; git submodule update;

curr_dir=`pwd`


#Set up vim
[[ -d $HOME/.vim ]] && mv $HOME/.vim $HOME/.vim-bkp 
ln -s $curr_dir/vim $HOME/.vim

[[ -f $HOME/.vimrc ]] && mv $HOME/.vimrc $HOME/.vimrc-bkp
ln -s $HOME/.vim/vimrc $HOME/.vimrc

#gnome-terminal
gconftool-2 --load $curr_dir/gnome-terminal/config.xml 

#Zshell
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
mv $HOME/.oh-my-zsh/custom $HOME/.oh-my-zsh/custom-bkp
mv $HOME/.zshrc $HOME/.zshrc-bkp
ln -s $curr_dir/zsh/zshrc $HOME/.zshrc
ln -s $curr_dir/zsh/oh-my-zsh/custom $HOME/.oh-my-zsh/custom
chsh -s /bin/zsh


#tmux
[[ -f $HOME/.tmux.conf ]] && mv $HOME/.tmux.conf $HOME/.tmux.conf-bkp
ln -s $curr_dir/tmux.conf $HOME/.tmux.conf
