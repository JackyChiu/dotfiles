#/bin/bash

# Varibles
backup=~/dotfiles_backup
dir=$(pwd)
dotfiles="
.tmux.conf
.zshrc
.gitconfig
.gitignore_global
.tern-config
.khdrc
.kwm
.iterm2
.config/nvim/plugins.vim
.config/nvim/init.vim"

# Backup
mkdir -p $backup
echo "Backup dir: $backup"

# Move backups and create sym links
for dotfile in $dotfiles; do
	mv ~/$dotfile $backup
	echo "Current $dotfile moved to: $backup\n"
	ln -s $dir/$dotfile ~/$dotfile
	echo "Symbloic link for $dotfile made in ~\n"
done
