#!/bin/bash

MPATH="/root/dev/mailcow-dockerized"        ## change here your mailcow-dockerized install path
MCONF="mailcow.conf"

MYPATH=$(pwd)

## test path/file
if [ ! -f "${MPATH}/${MCONF}" ] ; then
    echo "file or directory not found, please verify the MPATH= and MCONF= variable";
    exit 1
fi

cd $MPATH
source $MCONF

echo
docker ps -a -f status=running
echo
echo

while true; do
    read -p "Do you want to cleanup further garbage collected by Docker, please make sure all containers are up and running before cleaning your system by executing? y/n " yn
    case $yn in
        [Yy]* ) docker system prune; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

cd $MYPATH
