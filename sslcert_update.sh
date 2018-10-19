#!/bin/bash

MCDOMAIN="mx.foobar.com"
LETSPATH="/etc/letsencrypt/live/"

echo "Do you wish to upgrade ssl certificates?"

upgrade () {

  echo "start updating ssl certs"
  mypath=$(pwd)

  cd /root/dev/mailcow-dockerized
  source mailcow.conf
   
  ## mv data/assets/ssl/*{,.bak.`date +%Y%m%d`}
  cp -a data/assets/ssl data/assets/ssl_old
 
  ## copy letsencrypts to mailcow container 
  cp -L ${LETSPATH}/${MCDOMAIN}/cert.pem data/assets/ssl/cert.pem
  cp -L ${LETSPATH}/${MCDOMAIN}/privkey.pem data/assets/ssl/key.pem
  # cp -L /etc/ssl/mail/dhparams.pem

  docker-compose restart
  cd $mypath

}

select yn in "Yes" "No"; do
    case $yn in
        Yes ) upgrade; break;;
        No ) exit;;
    esac
done
