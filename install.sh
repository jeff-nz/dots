#!/bin/bash
SOURCE="${BASH_SOURCE[0]}"
RDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS=`uname -s`
DISTRIB_ID=$(lsb_release -si)
tmpDir=$RDIR'/tmp'

. $RDIR'/files/bin/functions'


if [ "$DISTRIB_ID" == "Ubuntu" ]; then
    read -p "Run system update now?(Y/N) " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
       printf '\nproceeding with update...\n'
       sudo apt-get update
    else
       printf '\nproceeding with no update...\n'
    fi
fi

if [ ! -d "$tmpDir" ]; then
    mkdir $tmpDir 
fi

for i in $( ls -a $RDIR'/files' ); do
    if [ $i != '.' ] && [ $i != '..' ]; then
        filePath=$HOME'/'$i

       # printf '\n=============\n'$filePath'\n'
	    entityType=$(getEntityType $filePath)
        if [ "$entityType" == "LINK" ]; then
            unlink $filePath
        else
            if [ -d "$filePath" ] || [ -f "$filePath" ]; then
                mv $filePath $tmpDir
            fi
        fi

        ln -s $RDIR'/files/'$i $HOME'/'$i
    fi
done
