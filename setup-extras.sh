#!/usr/bin/env bash

mkdir -p $HOME/.config/fish
mkdir -p $HOME/.vim/tmp

curl -L https://get.oh-my.fish | fish

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
