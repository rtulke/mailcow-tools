#!/bin/bash

####
# allows the sender and return address to be different
#
# vim data/conf/postfix/main.cf
#   replace:  smtpd_sender_login_maps = proxy:mysql:/opt/postfix/conf/sql/mysql_virtual_sender_acl.cf
#   with:     smtpd_sender_login_maps = hash:/opt/postfix/conf/sender_login_maps, proxy:mysql:/opt/postfix/conf/sql/mysql_virtual_sender_acl.cf

sender_login_maps="./data/conf/postfix/sender_login_maps"
sr=${sender_login_maps##*/}

if [ ! -f $sender_login_maps ]; then
    echo "File not found, create new one"
    touch $sender_login_maps
fi


tmpmd51=$(mktemp /tmp/${sr}.XXXXXX)
md5sum $sender_login_maps > $tmpmd51
md51=$(cat $tmpmd51 |awk '{print $1}')

vim $sender_login_maps

tmpmd52=$(mktemp /tmp/${sr}.XXXXXX)
md5sum $sender_login_maps > $tmpmd52
md52=$(cat $tmpmd52 |awk '{print $1}')

if [ ! $md51 == $md52 ]; then
  status="1"
  echo "update postmap md5sum differs $md51 $md52"
  docker-compose exec postfix-mailcow postmap /opt/postfix/conf/sender_login_maps
  docker-compose exec postfix-mailcow chmod 644 /opt/postfix/conf/sender_login_maps /opt/postfix/conf/sender_login_maps.db
  docker-compose exec postfix-mailcow chown root: /opt/postfix/conf/sender_login_maps /opt/postfix/conf/sender_login_maps.db
  docker-compose exec postfix-mailcow postfix reload
fi

if [ "$status" == "1" ]; then
  read -p "do you want to see postfix log? [y/n]: " plog
  if [ "$plog" == "y" ]; then
    docker logs mailcowdockerized_postfix-mailcow_1 --tail 30 -f
  fi
fi
exit 0
