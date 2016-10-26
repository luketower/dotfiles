autoload -U promptinit && promptinit
autoload -U colors && colors

git_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ $ref == "" ]]; then
    branch=" "
  else
    branch=" ("${ref#refs/heads/}") "
  fi
  PROMPT="%{$fg_bold[cyan]%}%~%{$fg_bold[red]%}$branch%{$reset_color%}"$'\n'"λ "
}

precmd() { git_branch }
