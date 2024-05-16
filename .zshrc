export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/snap/bin:$PATH"
export PATH="$PATH:/Users/sebastianandersen/.local/bin"
export EDITOR=vim
export VISUAL="$EDITOR"

set editing-mode vi
set keymap vi

alias linuxserver="ssh seby@kjaeldgaard.com"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vim='nvim'
alias la='ls -A'

if [[ $(uname) == "Linux" ]]; then
    CODE="/mnt/c/Users/Sebastian/OneDrive - Aalborg Universitet/Skrivebord/coding/"
else
    CODE=~/Desktop/coding/
fi
alias coding='cd $CODE' 

go() { 
  cd $CODE$1 && 
  tmux new-session -s "$1" \; send-keys 'nvim' Enter
}

export PS1='%1d > '
unsetopt BEEP
