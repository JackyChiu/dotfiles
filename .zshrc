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
#java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin
#maven
export PATH=$PATH:/usr/local/Cellar/maven/3.5.0/bin

# Default vim
export VISUAL=/usr/local/bin/vim
export EDITOR=$VISUAL

# FZF fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# --files: List files that would be searched but do not search
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--preview 'cat {}' --reverse --height 20%"
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

###ALIAS###
# vim
alias lvst="vim --startuptime /dev/stdout +qall"

# I do this too often
alias bsrk="brew services restart kwm"

# Open current git project
alias gh="open https://github.$(git config remote.origin.url | cut -f2 -d. | tr ':' /)"

# ctags
alias ctags=`brew --prefix`/bin/ctags

#directories (you on't want these)
alias dev=/Users/jackychiu/Dev
alias dot=/Users/jackychiu/Dev/dotfiles
alias widget="/Users/jackychiu/Library/Application\ Support/Übersicht/widgets/nerdbar.widget"
alias carleton="/Users/jackychiu/Google\ Drive/Carleton"
