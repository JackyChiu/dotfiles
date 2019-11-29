## dotfiles ❤️

![setup](.github/setup.png)

### Vim Setup
```bash
# vim-plug install
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vim plugin install
vim ~/.vimrc
:PlugInstall
```

### Tmux Setup

```bash
# reattach-to-user-namespace
brew install reattach-to-user-namespace

# tpm (tmux package manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Development Tools:
- [neovim](https://github.com/neovim/neovim)
- [tmux](https://github.com/tmux/tmux)

## Window Management:
- [chunkwm](https://github.com/koekeishiya/chunkwm)
- [khd](https://github.com/koekeishiya/khd)
- [Ubersicth](http://tracesof.net/uebersicht/)

## Extra info
- Zsh Theme: [Spaceship](https://github.com/denysdovhan/spaceship-zsh-theme)
- iTerm & Neovim Theme: [vim-quantum](https://github.com/tyrannicaltoucan/vim-quantum)
- yabai status bar requires FontAwesome 4.7
