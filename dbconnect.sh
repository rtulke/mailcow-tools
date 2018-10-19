#!/bin/bash

MPATH="/root/dev/mailcow-dockerized"
MCONF="mailcow.conf"

MYPATH=$(pwd)


## test path/file
if [ ! -f "${MPATH}/${MCONF}" ] ; then
    echo "file or directory not found, please verify the MPATH= and MCONF= variable";
    exit 1
fi

cd $MPATH
source $MCONF

DBPASS=$(grep "DBPASS=" ${MPATH}/${MCONF} |awk -F 'DBPASS=' {'print $2'})

docker-compose exec mysql-mailcow mysql -umailcow -p${DBPASS} mailcow

cd $MYPATH
