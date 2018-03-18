OS=`uname -s`;
#GOLANG
if [ -d ${HOME}"/apps/go" ]; then
    export GOROOT=${HOME}/apps/go
    export GOROOT_BOOTSTRAP=${GOROOT}
    export PATH=${PATH}:${GOROOT}/bin
    if [ -d ${HOME}"/projects/go" ]; then
        export GOPATH=${HOME}/projects/go
        export GOBIN=${GOPATH}/bin
    else
        echo "Please create a folder in "${HOME}/projects/go" for go workspace"
    fi
else
    echo "Please install extract go in "${HOME}/apps/go;
fi


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval         "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias cls='clear'
alias dock-stop='docker stop $(docker ps -qa)'
alias dock-rm-containers='dock-stop; docker rm $(docker ps -aq)'
alias dock-rm-images='dock-rm-containers;docker rm $(docker images -aq); docker rmi -f $(docker images -qa)'
alias dockc='docker-compose'

#REQUIRES docker pull golang
alias dock-go='docker run --rm -v "$PWD":/app -w /app golang:latest go'

alias ll='ls -alFh'
alias lla='ls -laFh'
alias la='ls -AF'
alias l='ls -CF'
alias my-explore='nautilus --no-desktop &'
alias my-ip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
#"ifconfig | grep "inet " | grep -v "127.\|172." | awk '{print $2}' | head -1 -"

alias my-portlisten="sudo lsof -PiTCP -sTCP:LISTEN"


alias xm='ssh -F $HOME/.ssh/xm/config'
alias xms='scp -F $HOME/.ssh/xm/config'

