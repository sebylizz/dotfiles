setopt hist_ignore_dups
setopt inc_append_history

alias tmux='tmux -2'
alias linuxserver="ssh seby@kjaeldgaard.com"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vim='nvim'
alias v='nvim'
alias la='ls -A'
alias tk='tmux kill-session'
alias lg='lazygit'

PROMPT='%F{blue}%1d >%f '

export EDITOR='nvim'
export VISUAL='nvim'

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

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
