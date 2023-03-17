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

# Install other useful binaries.
brew install tree
brew install pandoc
brew install ngrep
brew install ripgrep

# TODO(rylan): Determine whether to transition to container-based dev environments.
# Install development utilities.
brew install openjdk@11
brew install k6 # Load testing https://k6.io
brew install python@3.10
brew install poetry # Python package management.
brew install rustup-init

# Install formula
brew install --formula \
nvim

# Install applications.
brew install --cask \
calibre \
beekeeper-studio \
bitwarden \
blender \
docker \
firefox \
font-firacode-nerd-font \
google-chrome \
hot \
iterm2 \
microsoft-edge \
ngrok \
notion \
obsidian \
oracle-jdk \
plex-media-server \
postman \
rectangle \
sequel-pro \
spotify \
steam \
sublime-merge \
sqlite \
visual-studio-code \
vlc \
wireshark \
zotero
# obs \
# virtualbox \

# Remove outdated versions from the cellar.
brew cleanup
