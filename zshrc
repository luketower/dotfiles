export EDITOR=vim
bindkey -e

source ~/.zsh/history.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/complete.zsh
source ~/.zsh/gopath.zsh
source ~/.zsh/path.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/ruby.zsh
source ~/.zsh/functions.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
