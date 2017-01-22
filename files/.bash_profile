# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi


#LS Colors 
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


# Show always fullpath on terminal
git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }
BRANCH=' \033[01;31m\]$(git_branch)\[\033[00m\] '
export PS1='\[\033[33;1m\]\u\[\033[m\]@\H [\[\033[36m\]\w\[\033[m\]]'$BRANCH'\n$ '


#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "


if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi


# Alias
alias ls='ls -GFh'
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
