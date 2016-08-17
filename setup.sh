#/bin/bash

# Varibles
backup=~/dotfiles_backup
dir=$(pwd)
dotfiles=".vimrc .tmux.conf .vim .zshrc .bashrc"

# Backup
mkdir -p $backup
echo "Backup dir: $backup"

# Move backups and create sym links
for dotfile in $dotfiles; do
	mv ~/.$file $backup
	echo "Current $dotfile moved to: $backup"
	ln -s $dir/$file ~/.$file
	echo "Symbloic link for $file made in ~"
done
