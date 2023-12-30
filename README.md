# Dotfiles

This repository contains my personal dotfiles for setting up and maintaining a consisten environment across different systems. The dotfiles are managed using GNU Stow, which makes it easy to install and update configurations.

## Getting Started

### Installation

Clone the repository to your home directory.

Navigate to the clone repository

```bash
cd ~/.dotfiles
```

Run the `install.sh` script to setup the dotfiles.

```bash
sudo chmod +x ./install.sh
./install.sh
```

### Customizing Installation

The `install.sh` script uses GNU Stow to symlink the dotfiles to your home directory. You can customize which configurations to install by setting the `STOW_FOLDERS` variable:

```shell
STOW_FOLDERS="zsh,vim" ./install.sh
```