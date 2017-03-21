## JackyChiu's dotfiles
My beloved dotfiles, for development and window management. 

## vim+tmux
![setup](.github/setup.png)
## kwm+khd+ubersicth
![fullScreen](.github/fullScreen.png)

## Installing
I have a handly setup.sh script ready for installation, but you probably don't want all my files so go into the script and modify the line that defines the dotfiles to install
```bash 
git clone https://github.com/JackyChiu/dotfiles.git
cd dotfiles
./setup.sh
```

If you don't have vim-plug for vim installed in your `.vim` dir
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install plugins for vim
```bash
vim ~/.vimrc
:PlugInstall
```

*Side note: Mouse seting commands for .tmux.conf only work with tmux 2.1 +*

## Development Workflow:
- vim
- tmux

## Window Managment: 
- [kwm](https://github.com/koekeishiya/kwm)
- [khd](https://github.com/koekeishiya/khd)
- [Ubersicth](http://tracesof.net/uebersicht/)

## Extra info
- Using Oh My Zsh in iTerm2
- Zsh theme: [Spaceship](https://github.com/denysdovhan/spaceship-zsh-theme)
- Terminal theme: [Atom One Dark](https://github.com/joshdick/onedark.vim)
- Vim theme: [Atom One Dark](https://github.com/joshdick/onedark.vim)
- Lightline theme: [Atom One Dark](https://github.com/joshdick/onedark.vim)
- Nerbar theme: [Atom One Dark](https://github.com/JackyChiu/nerdbar.widget)

