#!/usr/bin/env bash

mkdir -p $HOME/.vim/tmp

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin
git clone https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack.vim
vim +PluginInstall +qall
