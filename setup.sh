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
	mv ~/$dotfile $backup
	echo "Current $dotfile moved to: $backup"
	ln -s $dir/$dotfile ~/$dotfile
	echo "Symbloic link for $dotfile made in ~"
done
