#!/bin/zsh

# Install command-line tools using Homebrew.

# Make sure we're using the latest Homebrew.
brew update

# Upgrade and already-installed formulae.
brew upgrade

# Save Homebrew's installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdate).
# Don't forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
#brew install coreutils
#ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
#brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g'-prefixed
#brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
#brew install gnu-sed --with-default-names

# Install personal macOS tools.
brew install ripgrep
brew install emacs
brew install php
brew install go
brew install erlang
brew install elixir

# Install other useful binaries.
brew install lua
brew install tree

# Install applications.
brew cask install hammerspoon
brew cask install rectangle
brew cask install alacritty
brew cask install sublime-merge
brew cask install font-firacode-nerd-font
brew cask install bitwarden
# Remove outdated versions from the cellar.
brew cleanup
