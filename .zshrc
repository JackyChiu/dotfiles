# Path to your oh-my-zsh installation.
export ZSH=/Users/jackychiu/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="spaceship"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="$VISUAL"
fi

# RUBY
SPACESHIP_RUBY_SHOW=false
SPACESHIP_PROMPT_TRUNC=0

# Default vim
export VISUAL="/usr/local/bin/vim"
export EDITOR="$VISUAL"
alias vim=$VISUAL
alias vi=$VISUAL

# npm
export PATH="$HOME/.npm-packages/bin:$PATH"

# ctags
alias ctags="`brew --prefix`/bin/ctags"

# Alias
alias dotfiles="/Users/jackychiu/Dev/dotfiles"
alias carleton="/Users/jackychiu/Google\ Drive/Carleton"
alias w17="/Users/jackychiu/Google\ Drive/Carleton/Winter\ 2017"
alias 2100="/Users/jackychiu/Google\ Drive/Carleton/Winter\ 2017/SYSC2100"

