##############################
#####   JackyChiu       ######
#####   zsh Dotfile     ######
##############################

export ZSH=/Users/jackychiu/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="spaceship"

plugins=(git tmux)

source $ZSH/oh-my-zsh.sh

# RUBY
SPACESHIP_RUBY_SHOW=false
SPACESHIP_PROMPT_TRUNC=0

#npm
export PATH=$PATH:$HOME/.npm-packages/bin
#golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Default vim
export VISUAL=/usr/local/bin/vim
export EDITOR=$VISUAL

# FZF fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS="--reverse --height 20%"
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

###ALIAS###
# docker
alias dqs="/Applications/Docker/Docker\ Quickstart\ Terminal.app/Contents/Resources/Scripts/start.sh" # Open Docker Terminal

# vim
alias lvst="vim --startuptime /dev/stdout +qall"

# I do this too often
alias bsrk="brew services restart kwm"

# ctags
alias ctags=`brew --prefix`/bin/ctags

#directories (you on't want these)
alias dev=/Users/jackychiu/Dev
alias dot=/Users/jackychiu/Dev/dotfiles
alias widget="/Users/jackychiu/Library/Application\ Support/Übersicht/widgets/nerdbar.widget"
alias carleton="/Users/jackychiu/Google\ Drive/Carleton"

### WORK EXPORTS ###
#java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin
#maven
export PATH=$PATH:/usr/local/Cellar/maven/3.5.0/bin
#groovy
export GRAILS_HOME=$HOME/Dev/klip/libs/grails-1.3.9
export PATH=$PATH:$GRAILS_HOME/bin
