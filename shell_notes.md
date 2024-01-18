# Shell notes

## Ripgrep

## fd

## fzf

## Git

- `git diff` compares working dir vs. staged in staging area (to see changed but not staged)
- `git diff --staged` to see staged vs. commit.

- `git add -i` interactive
- `git add -p` Stage parts of file with patch, and you can also partially reset

## Tmux

Tmux is using [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) to
manage plugins. After making modifications to tmux plugins you should rerun
`./install.sh` and then `prefix` + `I` to install new plugins.
