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
  vi-mode
)

# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="spaceship"
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

source $ZSH/oh-my-zsh.sh

### PATHS ###
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
alias bsrc="brew services restart chunkwm"

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
  kubectl exec -it "$(kpod)" -- /bin/bash
}

# Select and describe pod
kdesc () {
  kubectl describe "$(kpod)"
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

  nvim -c "let g:gitgutter_diff_base = 'master'" "$(git diff --name-only origin/master)"
}

#Directories (you won't want these)
alias gojc='$GOPATH/src/github.com/JackyChiu'
alias widget='/Users/jackychiu/Library/Application\ Support/Übersicht/widgets/nerdbar.widget'
alias carleton='/Users/jackychiu/Google\ Drive/Carleton'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jackychiu/src/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jackychiu/src/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jackychiu/src/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jackychiu/src/google-cloud-sdk/completion.zsh.inc'; fi
