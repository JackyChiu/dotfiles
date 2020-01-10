#!/bin/sh

# https://github.com/junegunn/vim-plug#neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Run installs
nvim +PlugInstall +UpdateRemotePlugins +qa
