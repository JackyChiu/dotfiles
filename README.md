## JackyChiu's dotfiles
My beloved dotfiles, for development and window management. 

## vim+tmux
![setup](.github/setup.png)
## kwm+khd+ubersicth
![fullScreen](.github/fullScreen.png)

## Installing
If you want to checkout my enviroment you can use my setup script or manually copy paste all the dotfiles into your `~` dir
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
- kwm
- khd
- Ubersicth

## Extra info
- Using Oh My Zsh in iTerm2
- Zsh theme: Spaceship, https://github.com/denysdovhan/spaceship-zsh-theme
- Terminal theme: Atom One Dark, https://github.com/nathanbuchar/atom-one-dark-terminal
- Vim theme: Atom One Dark, https://github.com/joshdick/onedark.vim
- Lightline theme: Atom One Dark, https://github.com/joshdick/onedark.vim
