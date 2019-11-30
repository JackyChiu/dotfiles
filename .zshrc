##############################
#####   JackyChiu       ######
#####   zsh Dotfile     ######
##############################

### SHELL ###
export ZSH=/Users/jackychiu/.oh-my-zsh
plugins=(
  git
  github
  tmux
  zsh-autosuggestions
  zsh-syntax-highlighting
  vi-mode
)

### VISUAL ###

# Look in ~/$ZSH_CUSTOM/themes/
export ZSH_THEME="spaceship"

export SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Backgound jobs indicator
  char          # Prompt character
)

export SPACESHIP_RPROMPT_ORDER=(
  vi_mode       # Vi-mode indicator
)

export SPACESHIP_CHAR_SYMBOL="λ "
export SPACESHIP_CHAR_COLOR_FAILURE="green"
export SPACESHIP_VI_MODE_INSERT=""
export SPACESHIP_VI_MODE_NORMAL="[VI-MODE]"
export SPACESHIP_VI_MODE_COLOR="green"

source $ZSH/oh-my-zsh.sh

### PATHS ###
#npm
export PATH=$PATH:$HOME/.npm-packages/bin

#golang
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

#rust
if [ -x "$(command -v rustc)" ]; then
  export PATH=$PATH:$HOME/.cargo/bin
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

# macOS brew MySQL
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# Default vim
export VISUAL=/usr/local/bin/nvim
export EDITOR=$VISUAL

###  AUTOCOMPLETE ###

# FZF fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# --files: List files that would be searched but do not search
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git/*,vendor/*}"'
export FZF_DEFAULT_OPTS="--preview 'head -100 {}' --reverse --height 40%"

### ALIAS ###
# Reset window manager
alias bsry="brew services restart yabai"

# Kubernetes
alias k='kubectl'

# Select and use context
kctx () {
  local context
  context=$(kubectl config get-contexts -o name | fzf )
  kubectl config use-context "$context"
}

# Select and use namespace
kns () {
  local context
  context=$(kubectl config current-context)

  local namespace
  namespace=$(kubectl get namespaces | fzf | awk '{ print $1 }')

  kubectl config set-context "$context" --namespace "$namespace"
}

# Gets the name of a pod
kpod () {
  kubectl get pods | fzf | awk '{ print $1 }'
}

# Select and exec into pod
kexec () {
  kubectl exec -it "$(kpod)" -- /bin/sh
}

# Select and describe pod
kdesc () {
  kubectl describe pod "$(kpod)"
}

# Review code by loading diff's in vim-buffers
review () {
  local default_branch
  default_branch=$(git rev-parse --abbrev-ref HEAD)

  local branch
  branch="${1:-$default_branch}"

  git fetch origin "$branch"
  git checkout "$branch"
  git rebase origin/"$branch"

  [[ -a "dev.yml" ]] && dev up

  nvim -c "let g:gitgutter_diff_base = 'master'" $(git diff --name-only origin/master)
}

gch() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# Directories (you won't want these)
alias gojc='$GOPATH/src/github.com/JackyChiu'
alias widget='/Users/jackychiu/Library/Application\ Support/Übersicht/widgets/nerdbar.widget'
alias carleton='/Users/jackychiu/Google\ Drive/Carleton'
alias go-play='nvim $GOPATH/src/main.go'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jackychiu/src/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jackychiu/src/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jackychiu/src/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jackychiu/src/google-cloud-sdk/completion.zsh.inc'; fi

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/jackychiu/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
