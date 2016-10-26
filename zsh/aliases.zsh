### Remove merged branches
alias rmmerged="git branch --merged | grep -v '\*' | xargs -n 1 git branch -d"

### Show directory tree
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

### Listing
alias ll="ls -l"
alias lla="ls -la"

### Folder Navigation
alias up="cd .."
alias code="cd ~/Dropbox/code/"
alias books="cd ~/Dropbox/books/"

### Git Commands
alias gc="git commit"
alias gs="git status"
alias ga="git add"
alias gp="git push"
alias gpo="git push origin"
alias gco="git checkout"
alias gb="git branch"
alias gd="git diff"
alias gl="git log"

# CLICOLOR=1
# LSCOLORS=gxgxcxdxbxegedabagacad
