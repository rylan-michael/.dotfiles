#!/usr/bin/env zsh

if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="zsh"
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/.dotfiles
fi

pushd "$DOTFILES" || { echo "Failed to change directory to $DOTFILES"; exit 1; }
for folder in ${STOW_FOLDERS//,/ /}
do
    echo "stow $folder"
    stow -D "$folder"
    stow "$folder"
done
popd || { echo "popd failed"; exit 1; }