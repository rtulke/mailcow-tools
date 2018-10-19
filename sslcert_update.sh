#!/bin/bash

echo "Do you wish to upgrade ssl certificates?"

upgrade () {

  echo "start updating ssl certs"
  mypath=$(pwd)

  cd /root/dev/mailcow-dockerized
  source mailcow.conf

  #mv data/assets/ssl/*{,.bak.`date +%Y%m%d`}
  cp -a data/assets/ssl data/assets/ssl_old

  cp -L /etc/letsencrypt/live/mx.rmail.org/cert.pem data/assets/ssl/cert.pem
  cp -L /etc/letsencrypt/live/mx.rmail.org/privkey.pem data/assets/ssl/key.pem
  cp -L /etc/ssl/mail/dhparams.pem

  docker-compose restart
  cd $mypath

}

select yn in "Yes" "No"; do
    case $yn in
        Yes ) upgrade; break;;
        No ) exit;;
    esac
done
