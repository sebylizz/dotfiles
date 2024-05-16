export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/snap/bin:$PATH"
export PATH="$PATH:/Users/sebastianandersen/.local/bin"
export EDITOR=vim
export VISUAL="$EDITOR"

eval $(thefuck --alias)

set editing-mode vi
set keymap vi

alias linuxserver="ssh seby@kjaeldgaard.com"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vim=nvim
alias coding="cd /mnt/c/Users/Sebastian/OneDrive\ -\ Aalborg\ Universitet/Skrivebord/coding/"
alias la='ls -A'

export PS1='%1d > '
unsetopt BEEP
