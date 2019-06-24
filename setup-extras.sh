#!/usr/bin/env bash

mkdir -p $HOME/.config/fish
mkdir -p $HOME/.vim/tmp

curl -L https://get.oh-my.fish | fish

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin
vim +PluginInstall +qall
