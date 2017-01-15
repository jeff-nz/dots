#todo
SOURCE="${BASH_SOURCE[0]}"
RDIR="$( dirname "$SOURCE" )"
OS=`uname -s`
#sudo apt-get update

cd $RDIR'/files' 
stow -vt ~/. .
