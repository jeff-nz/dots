# Show always fullpath on terminal
git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }
BRANCH=' \033[01;31m\]$(git_branch)\[\033[00m\] '
export PS1='\[\033[33;1m\]\u\[\033[m\]@\H [\[\033[36m\]\w\[\033[m\]]'$BRANCH'\n$ '


#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
