OS=`uname -s`;
#############
#GOLANG
if [ -d "/usr/local/go" ]; then
    export GOROOT=/usr/local/go
    export GOROOT_BOOTSTRAP=${GOROOT}
    if [ -d ${HOME}"/projects/go" ]; then
        export GOPATH=${HOME}/projects/go
        export GOBIN=${GOPATH}/bin
    else
        echo "Please create a folder in "${HOME}/projects/go" for go workspace"
    fi
else
    echo "Please install extract go in /usr/local/go and ADD export PATH=\$PATH:/usr/local/go/bin into etc/bash.bashrc";
fi

##############
# BoF - Java, sdkman Stuff
export JAVA_HOME=/usr/lib/jvm/default

my-setup-sdk-java () {
    echo "RUNNING ${FUNCNAME[0]}..."

    local SDK_JAVA_PATH="/home/${USER}/.sdkman/candidates/java/current"
    local LIB_DIR_JAVA="/usr/lib/jvm"
    local LIB_DIR_DBEAVER="/usr/lib/dbeaver"

    # making sure sdk_java exist
    if [ ! -L "${SDK_JAVA_PATH}" ]; then
        echo "ERROR: Please setup JAVA in SDK. ${SDK_JAVA_PATH} does not exist.";
        return 1
    fi
    
    # java lib
    if [ -d "${LIB_DIR_JAVA}" ]; then
        echo "Setting path in ${LIB_DIR_JAVA}";

        sudo unlink "${LIB_DIR_JAVA}/default"
        sudo ln -s /home/jeff/.sdkman/candidates/java/current "${LIB_DIR_JAVA}/default"

        sudo unlink "${LIB_DIR_JAVA}/default-runtime"
        sudo ln -s /home/jeff/.sdkman/candidates/java/current "${LIB_DIR_JAVA}/default-runtime"
    fi

    # dbeaver lib
    if [ -d "${LIB_DIR_DBEAVER}" ]; then
        echo "Setting path in ${LIB_DIR_DBEAVER}";

        sudo unlink "${LIB_DIR_DBEAVER}/jre"
        sudo ln -s /home/jeff/.sdkman/candidates/java/current "${LIB_DIR_DBEAVER}/jre"
    fi

    echo "COMPLETED RUNNING ${FUNCNAME[0]}"
} # EoF - my-setup-sdk-java()



xmRun () {
    local DIRECTORY_NAME=$(basename ${PWD})
    local CONTAINER_MEMORY=${1:-256}
    local PROJECT_PROFILE=${2:-local,localdb,jeff}
    local MEMORY_LIMIT="128"

    if [ "${DIRECTORY_NAME}" == "config-daemon" ]; then
        echo "RUNNING MVN on CONFIG DAEMON"

        MEMORY_LIMIT="64"
        echo "RAM LIMIT: ${MEMORY_LIMIT}MB"

        MAVEN_OPTS="-Xmx${MEMORY_LIMIT}m" mvn clean package spring-boot:run -Dxmd.platform.config.git.uri=file://\$\{user.home\}/projects/xm/platform-central-configuration/
        return 1
    fi

    if [ "${DIRECTORY_NAME}" == "catalog-index" ]; then
        MEMORY_LIMIT="4096"
    fi

    if [ "${DIRECTORY_NAME}" == "customers" ]; then
        MEMORY_LIMIT="256"
    fi

    if [ "${DIRECTORY_NAME}" == "catalog-search" ]; then
        MEMORY_LIMIT="256"
    fi

    echo "RUNNING MVN on ${DIRECTORY_NAME}"
    echo "RAM LIMIT: ${MEMORY_LIMIT}MB"
    MAVEN_OPTS="-Xmx${MEMORY_LIMIT}m" mvn clean package spring-boot:run -Dmaven.test.skip=true -Dxmd.platform.spring.jvm.args="-Xmx${CONTAINER_MEMORY}m -Dspring.profiles.active=${PROJECT_PROFILE}"
} # EoF - xmRun()


# EoF - Java, sdkman Stuff
##############


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

alias my-portslisten="sudo lsof -PiTCP -sTCP:LISTEN"
alias my-portsudp="sudo lsof -PiUDP"

alias xm='ssh -F $HOME/.ssh/xm/config'
alias xms='scp -F $HOME/.ssh/xm/config'

