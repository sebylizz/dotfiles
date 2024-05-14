export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/sebastianandersen/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

# Created by `pipx` on 2024-03-30 20:05:48
export PATH="$PATH:/Users/sebastianandersen/.local/bin"
export EDITOR=vim
export VISUAL="$EDITOR"

alias linuxserver="ssh seby@kjaeldgaard.com"

eval $(thefuck --alias)

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"
alias vim=nvim
set editing-mode vi
set keymap vi

alias dotfiles=/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME
