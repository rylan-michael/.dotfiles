#!/bin/zsh

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/oh-my-zsh ~/.oh-my-zsh
ln -s ${BASEDIR}/zshrc ~/.zshrc
