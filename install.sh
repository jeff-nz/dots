SOURCE="${BASH_SOURCE[0]}"
RDIR="$( dirname "$SOURCE" )"
OS=`uname -s`
DISTRIB_ID=$(lsb_release -si)

if [ "$DISTRIB_ID" == "Ubuntu" ]; then
    read -p "Run system update now?(Y/N) " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
       sudo apt-get update
       printf '\nproceeded with update...\n'
    else
       printf '\nproceeding with no update...\n'
    fi
fi

cd $RDIR'/files' 
stow -vt ~/. .
