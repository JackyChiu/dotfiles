export ZSH=/Users/jackychiu/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="spaceship"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git tmux)

source $ZSH/oh-my-zsh.sh

# RUBY
SPACESHIP_RUBY_SHOW=false
SPACESHIP_PROMPT_TRUNC=0

#npm
export PATH="$HOME/.npm-packages/bin:$PATH"

# Default vim
export VISUAL="/usr/local/bin/vim"
export EDITOR="$VISUAL"

###ALIAS###
#vim
alias vim=$VISUAL
alias vi=$VISUAL
alias lvst="vim --startuptime /dev/stdout +qall"
# ctags
alias ctags="`brew --prefix`/bin/ctags"
#directories
alias dev="/Users/jackychiu/Dev"
alias dot="/Users/jackychiu/Dev/dotfiles"
alias widget="/Users/jackychiu/Library/Application\ Support/Übersicht/widgets/nerdbar.widget"
alias carleton="/Users/jackychiu/Google\ Drive/Carleton"
alias w17="/Users/jackychiu/Google\ Drive/Carleton/Winter\ 2017"
alias 2100="/Users/jackychiu/Google\ Drive/Carleton/Winter\ 2017/SYSC2100"
alias 2003="/Users/jackychiu/Google\ Drive/Carleton/Winter\ 2017/SYSC2003"

