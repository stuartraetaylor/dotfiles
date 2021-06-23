#!/usr/bin/env bash
declare -a dotfiles=("bashrc" "vimrc" "tmux.conf" "gitconfig")

link_file() {
    f=$1
    echo
    read -r -p "Install .$f (overwrite existing file) [Y/n]? " r
    if [[ $r =~ ^(\s*|[yY])$ ]]; then
        echo "Creating symlink ~/.$f ..."
        ln -fs $PWD/$f $HOME/.$f
    else
        echo "Skipping .$f ..."
    fi
}

# ~/ files.
for f in "${dotfiles[@]}"; do
    link_file $f
done
