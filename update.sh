#!/bin/bash
declare -a dotfiles=("bashrc" "vimrc" "gitconfig" "tmux.conf")

for f in "${dotfiles[@]}"; do
    echo
    read -r -p "Update .$f (overwrite existing file): [Y]es, [N]o? " r   
    if [[ $r =~ ^([yY])$ ]]; then
        echo "Updating .$f ..."
        ln -fs $PWD/$f $HOME/.$f
    else
        echo "Skipping .$f ..."
    fi
done

