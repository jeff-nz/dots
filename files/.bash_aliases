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

alias my-dd='sudo dd bs=2048 status=progress'
alias my-explore='nautilus --no-desktop &'
alias my-ip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
alias my-gpuAvailable="lspci -k | grep -EA3 'VGA|3D|Display'"
alias my-gpuOpenGL="glxinfo | grep OpenGL"
alias my-mci="MAVEN_OPTS=\"-Xmx2048m -Xms1024m -Djava.awt.headless=true -XX:+TieredCompilation -XX:TieredStopAtLevel=1\" mvn -T 1C clean install"
alias my-mci-notest="MAVEN_OPTS=\"-Xmx2048m -Xms1024m -Djava.awt.headless=true -XX:+TieredCompilation -XX:TieredStopAtLevel=1\" mvn -T 1C clean install -Dmaven.test.skip -DskipTests"
alias my-public-ip="echo $(curl -s https://tools.webisometry.com/my-public-ip)"
alias my-reset-plasma-desktop-config="rm ~/.config/plasma-org.kde.plasma.desktop-appletsrc"
alias my-restart-shell="exec -l $SHELL"
alias my-setAuthorizedKeys="chmod 700 ~/.ssh && curl https://github.com/jeff-nz.keys > ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
alias my-syncDumpsFolder="rsync -av --progress /home/${USER}/dumps/* ${USER}@catcom:/home/${USER}/dumps"
#"ifconfig | grep "inet " | grep -v "127.\|172." | awk '{print $2}' | head -1 -"

alias my-portslisten="sudo lsof -PiTCP -sTCP:LISTEN"
alias my-portsudp="sudo lsof -PiUDP"
alias my-ramSpec="sudo lshw -c memory"
alias my-top-memoryConsumption="ps -eo pmem,pcpu,vsize,pid,cmd | sort -k 1 -nr | head -10"
alias my-update-keyring="sudo pacman -Sy archlinux-keyring"

alias xm='ssh -F $HOME/.ssh/xm/config'
alias xms='scp -F $HOME/.ssh/xm/config'

