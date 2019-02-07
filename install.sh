#!/bin/bash
declare -a dotfiles=("bashrc" "vimrc" "tmux.conf" "gitconfig")

for f in "${dotfiles[@]}"; do
    echo
    read -r -p "Install .$f (overwrite existing file) [Y/n]? " r
    if [[ $r =~ ^(\s*|[yY])$ ]]; then
        echo "Creating symlink ~/.$f ..."
        ln -fs $PWD/$f $HOME/.$f
    else
        echo "Skipping .$f ..."
    fi
done

