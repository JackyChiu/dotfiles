#/bin/bash

# Varibles
backup=~/dotfiles_backup
dir=$(pwd)
dotfiles="
.vimrc
.tmux.conf
.vim
.zshrc
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

# Dir for backup/swap files
mkdir -p ~/.vim/.backup
mkdir -p ~/.vim/.swap
mkdir -p ~/.vim/.undo
echo "Dirs made for backup/swap/undo files\n"
