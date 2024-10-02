setopt hist_ignore_dups  # Avoid duplicate entries in command history
setopt inc_append_history  # Append to history, don't overwrite it

alias tmux='tmux -2'  # Ensure tmux starts with 256-color support
alias linuxserver="ssh seby@kjaeldgaard.com"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vim='nvim'
alias v='nvim'
alias la='ls -A'
alias tk='tmux kill-session'
alias lg='lazygit'

PROMPT='%1d > '

export EDITOR='nvim'
export VISUAL='nvim'
set -o vi

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Lazy-load sdkman
export SDKMAN_DIR="$HOME/.sdkman"
load_sdkman() {
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
}

sdk() { load_sdkman; sdk "$@"; }

export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
export M2_HOME="$HOME/.sdkman/candidates/maven/current"
export PATH="/snap/bin:~/.local/bin:$JAVA_HOME/bin:$M2_HOME/bin:$HOME/.juliaup/bin:$PATH"

export TERM=xterm-256color

source ~/.profile
