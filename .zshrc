export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/snap/bin:$PATH"
export PATH="$PATH:/Users/sebastianandersen/.local/bin"
export PATH="$PATH:/home/seby/.local/bin"
export EDITOR=vim
export VISUAL="$EDITOR"
export LANG="en_US.UTF-8"

set editing-mode vi
set keymap vi

alias linuxserver="ssh seby@kjaeldgaard.com"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vim='nvim'
alias v='nvim'
alias la='ls -A'
alias tk='tmux kill-session'
alias lg='lazygit'

if [[ $(uname) == "Linux" ]]; then
    CODE="/mnt/c/Users/Sebastian/OneDrive - Aalborg Universitet/Skrivebord/coding/"
else
    CODE=~/Desktop/coding/
fi
alias coding='cd $CODE' 

go() { 
    if tmux has-session -t "$1" 2>/dev/null; then
        tmux attach-session -t "$1"
    else
        tmux new-session -c $CODE/$1 -s "$1" \; send-keys 'nvim' Enter
    fi
}

export PS1='%1d > '
unsetopt BEEP

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/seby/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

source ~/.profile
alias mvngo="mvn clean package && mvn exec:java"
