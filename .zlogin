# Start tmux on login
if declare -f _zsh_tmux_plugin_run > /dev/null; then
  if [[ ! -v TMUX ]]; then
    _zsh_tmux_plugin_run
  fi
fi
