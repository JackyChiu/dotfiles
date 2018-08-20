#!/bin/sh

# Varibles
backup=~/dotfiles_backup
dir="$(pwd)"
dotfiles="
.tmux.conf
.zshrc
.gitconfig
.gitignore_global
.tern-config
.khdrc
.chunkwmrc
.iterm2
.config/nvim"

# Backup
mkdir -p $backup
echo "Backup dir: $backup"

# Setup config
mkdir ~/.config

for dotfile in $dotfiles; do
  # move backups
  [[ -h ~/$dotfile ]] && unlink ~/"$dotfile"
	if [[ -f ~/$dotfile ]]; then
    mv ~/"$dotfile" "$backup"/"$dotfile"
    echo "Current $dotfile moved to: $backup/$dotfile"
  fi

  # make symlinks
  ln -s "$dir"/"$dotfile" ~/"$dotfile"
	echo "Symbloic link for ~/$dotfile"
done
