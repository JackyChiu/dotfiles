##############################
#####   JackyChiu       ######
#####   zsh Dotfile     ######
##############################

export ZSH=/Users/jackychiu/.oh-my-zsh

plugins=(
  git
  tmux
  zsh-autosuggestions
)

# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="spaceship"

source $ZSH/oh-my-zsh.sh

export SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Backgound jobs indicator
  char          # Prompt character
)

#npm
export PATH=$PATH:$HOME/.npm-packages/bin
#golang
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
#rust
export PATH=$PATH:$HOME/.cargo/bin
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Default vim
export VISUAL=/usr/local/bin/nvim
export EDITOR=$VISUAL

### VI MODE ### https://github.com/bl/dotfiles/blob/master/.zsh/prompt.zsh
# vi mode
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
# set timeout for switching modes to be very low
export KEYTIMEOUT=1
# display the current (vim-like) mode on the right prompt
function zle-line-init zle-keymap-select {
	VIM_NORMAL="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
	VIM_INSERT="%{$fg_bold[green]%} [% INSERT]%  %{$reset_color%}"
	RPS1="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT} $VCS_PROMPT"
	zle reset-prompt
}
# Remove the (vim-like) mode prompts before executing. This way they don't
# display in the history of the previous prompts (unnecessary to see what mode I
# completed the prompt on)
function zle-line-finish {
	RPS1="$VCS_PROMPT"
	zle reset-prompt
}
# bind functions above to the following events:
zle -N zle-line-init # executed every time line editor starts reading a new line
zle -N zle-keymap-select # executed every time mode switches (ie vicmd/main)
zle -N zle-line-finish # executed at the end of a prompts execution

# FZF fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# --files: List files that would be searched but do not search
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--preview 'cat {}' --reverse --height 40%"
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

###ALIAS###
# I do this too often
alias bsrk="brew services restart kwm"

#directories (you on't want these)
alias gojc=$GOPATH/src/github.com/JackyChiu
alias dev=/Users/jackychiu/Dev
alias dot=/Users/jackychiu/Dev/dotfiles
alias widget="/Users/jackychiu/Library/Application\ Support/Übersicht/widgets/nerdbar.widget"
alias carleton="/Users/jackychiu/Google\ Drive/Carleton"
