#!/usr/bin/env zsh
if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="zsh,nvim"
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/.dotfiles
fi

pushd "$DOTFILES" || { echo "Failed to change directory to $DOTFILES"; exit 1; }
IFS=',' read -A folders <<< "$STOW_FOLDERS"
for folder in "${folders[@]}"
do
    echo "stow: DEBUG: configuring package '$folder'"
    stow -D "$folder"
    stow "$folder"
done
popd || { echo "popd failed"; exit 1; }

# `<<<` operator to pass the contents of the `STOW_FOLDERS` environment variable to the `read` command.
# We set the `IFS` (Internal Field Separator) to ',' to specify comma-separate values.
# The `-A` flag is used with `read` to read the input as an array and store the result in the `folders` variable.