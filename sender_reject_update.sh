!/bin/bash

sender_reject="./data/conf/postfix/sender_reject"
sr=${sender_reject##*/}

if [ ! -f $sender_reject ]; then
    echo "File not found, create new one"
    touch $sender_reject
fi

tmpmd51=$(mktemp /tmp/${sr}.XXXXXX)
md5sum $sender_reject > $tmpmd51
md51=$(cat $tmpmd51 |awk '{print $1}')

vim $sender_reject

tmpmd52=$(mktemp /tmp/${sr}.XXXXXX)
md5sum $sender_reject > $tmpmd52
md52=$(cat $tmpmd52 |awk '{print $1}')

if [ ! $md51 == $md52 ]; then
  status="1"
  echo "update postmap md5sum differs $md51 $md52"
  docker-compose exec postfix-mailcow postmap /opt/postfix/conf/sender_reject
  docker-compose exec postfix-mailcow chmod 644 /opt/postfix/conf/sender_reject /opt/postfix/conf/sender_reject.db
  docker-compose exec postfix-mailcow chown root: /opt/postfix/conf/sender_reject /opt/postfix/conf/sender_reject.db
  docker-compose exec postfix-mailcow postfix reload
fi

if [ "$status" == "1" ]; then
  read -p "do you want to see postfix log? [y/n]: " plog
  if [ "$plog" == "y" ]; then
    docker logs mailcowdockerized_postfix-mailcow_1 --tail 30 -f
  fi
fi
exit 0
