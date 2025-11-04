HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

alias tmux='tmux -2'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vim='nvim'
alias v='nvim'
alias ls='ls --color --group-directories-first'
alias la='ls -A'
alias tk='tmux kill-session'
alias ..="cd .."

PROMPT="%F{blue}%1d >%f "

export EDITOR='nvim'
export VISUAL='nvim'
export LANG=en_US.UTF-8

export NVM_DIR=~/.nvm
export NVM_DIR="$HOME/.nvm"
load_nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}
alias nvm="load_nvm; nvm"
alias node="load_nvm; node"
alias npm="load_nvm; npm"
alias npx="load_nvm; npx"

export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
export M2_HOME="$HOME/.sdkman/candidates/maven/current"
export PATH="/usr/lib/rustup/bin:/snap/bin:$HOME/.local/bin:$JAVA_HOME/bin:$M2_HOME/bin:$PATH"

export TERM=xterm-256color
source <(fzf --zsh)

# Git autocomplete
autoload -Uz compinit && compinit
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

source $HOME/.profile
