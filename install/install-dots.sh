#todo
SOURCE="${BASH_SOURCE[0]}"
RDIR="$( dirname "$SOURCE" )"
OS=`uname -s`
#sudo apt-get update

echo $RDIR'/../files' 
stow -vt ~/. .
