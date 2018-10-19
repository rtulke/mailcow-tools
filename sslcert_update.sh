#!/bin/bash

MCDOMAIN="mx.foobar.com"
LETSPATH="/etc/letsencrypt/live/"
MPATH="/root/dev/mailcow-dockerized"        ## change here your mailcow-dockerized install path
MCONF="mailcow.conf"
MYPATH=$(pwd)

echo "Do you wish to upgrade ssl certificates?"

upgrade () {

  echo "start updating ssl certs"

  ## test mailconf exists
  if [ ! -f "${MPATH}/${MCONF}" ] ; then
    echo "file or directory not found, please verify the MPATH= and MCONF= variable";
    exit 1
  fi

  ## test letsencrypt cert path exists
  if [ ! -d "${LETSPATH}/${MCDOMAIN}" ] ; then
    echo "file or directory not found, please verify the MPATH= and MCONF= variable";
    exit 1
  fi

  cd $MPATH
  source $MCONF
    
  ## mv data/assets/ssl/*{,.bak.`date +%Y%m%d`}
  cp -a data/assets/ssl data/assets/ssl_old
 
  ## copy letsencrypts to mailcow container 
  cp -L ${LETSPATH}/${MCDOMAIN}/cert.pem data/assets/ssl/cert.pem
  cp -L ${LETSPATH}/${MCDOMAIN}/privkey.pem data/assets/ssl/key.pem
  # cp -L /etc/ssl/mail/dhparams.pem

  docker-compose restart
  cd $MYPATH

}

select yn in "Yes" "No"; do
    case $yn in
        Yes ) upgrade; break;;
        No ) exit;;
    esac
done
