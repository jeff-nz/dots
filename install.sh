SOURCE="${BASH_SOURCE[0]}"
RDIR="$( dirname "$SOURCE" )"
OS=`uname -s`
DISTRIB_ID=$(lsb_release -si)

if [ "$DISTRIB_ID" == "Ubuntu" ]; then
    sudo apt-get update
fi

cd $RDIR'/files' 
stow -vt ~/. .
