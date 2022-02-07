HISTSIZE=-1
HISTFILESIZE=-1

# alias
alias h='history'

# completion
  ## alacritty
alacritty_completion="$HOME/alacritty/extra/completions/alacritty.bash"
if [[ -f "${alacritty_completion}" ]]; then
  source "${alacritty_completion}"
fi

  ## tmux
tmux_completion="$HOME/tmux-bash-completion/completions/tmux"
if [[ -f "${tmux_completion}" ]]; then
  source "${tmux_completion}"
fi

  ## pip
pip_completion="$HOME/.pip_completion.bash"
if [[ -f "${pip_completion}" ]]; then
  source "${pip_completion}"
fi
