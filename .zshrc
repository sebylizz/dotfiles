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
export NVM_DIR="$HOME/.nvm"
load_nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}
alias nvm="load_nvm; nvm"
alias node="load_nvm; node"
alias npm="load_nvm; npm"
alias npx="load_nvm; npx"

export SDKMAN_DIR="$HOME/.sdkman"
load_sdkman() {
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
}

sdk() { load_sdkman; sdk "$@"; }

export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
export M2_HOME="$HOME/.sdkman/candidates/maven/current"
export PATH="/snap/bin:$HOME/.local/bin:$JAVA_HOME/bin:$M2_HOME/bin:$PATH"

export TERM=xterm-256color

source ~/.profile
