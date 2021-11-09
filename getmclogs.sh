#!/bin/bash



param="$2 $3"

case "$1" in

    postfix)
        docker logs $param mailcowdockerized_postfix-mailcow_1
    ;;

    rspamd)
        docker logs $param mailcowdockerized_rspamd-mailcow_1
    ;;

    acme)
        docker logs $param mailcowdockerized_acme-mailcow_1
    ;;

    nginx)
        docker logs $param mailcowdockerized_nginx-mailcow_1
    ;;

    php-fpm)
        docker logs $param  mailcowdockerized_php-fpm-mailcow_1
    ;;

    dovecot)
        docker logs $param mailcowdockerized_dovecot-mailcow_1
    ;;

    netfilter)
        docker logs $param mailcowdockerized_netfilter-mailcow_1
    ;;

    ipv6nat)
        docker logs $param  mailcowdockerized_ipv6nat_1
    ;;

    sogo)
        docker logs $param mailcowdockerized_sogo-mailcow_1
    ;;

    clamd)
        docker logs $param mailcowdockerized_clamd-mailcow_1
    ;;

    mysql)
        docker logs $param mailcowdockerized_mysql-mailcow_1
    ;;

    memcached)
        docker logs $param mailcowdockerized_memcached-mailcow_1
    ;;

    unbound)
        docker logs $param mailcowdockerized_unbound-mailcow_1
    ;;

    dockerapi)
        docker logs $param mailcowdockerized_dockerapi-mailcow_1
    ;;

    watchdog)
        docker logs $param mailcowdockerized_watchdog-mailcow_1
    ;;

    redis)
        docker logs $param mailcowdockerized_redis-mailcow_1
    ;;

    ofelia)
	docker logs $param mailcowdockerized_ofelia-mailcow_1
    ;;

    olefy)
	docker logs $param mailcowdockerized_olefy-mailcow_1
    ;;

    solr)
    	docker logs $param mailcowdockerized_solr-mailcow_1
    ;;

    --all|all)
        mypath=$(pwd)
        cd /opt/mailcow-dockerized
        source mailcow.conf
        docker-compose logs
    ;;

    -h|--help|help|*|?)
      echo
      echo "Usage: $0 [filter|all|--help] <params>"
      echo
      echo "  e.g. $0 postfix -f --since=1m"
      echo
      echo "  Parameter"
      echo
      echo "  -f | --follow               To follow docker log output or tail continuously"
      echo "  --tail 250                  To see last n lines of logs"
      echo "  --timestamps                To see logs since particular date or timestamp"
      echo "  --since 2017-05-03          if only a day’s log needs to be viewed"
      echo "  --since 2017-05-03T10:00    if only a day’s log needs to be viewed since 10 am"
      echo "

  Filters   |  Containers
  ----------+-----------------------------------------
  all       |  print logs of all containers
  postfix   |  mailcowdockerized_postfix-mailcow_1
  dovecot   |  mailcowdockerized_dovecot-mailcow_1
  nginx     |  mailcowdockerized_nginx-mailcow_1
  mysql     |  mailcowdockerized_mysql-mailcow_1
  sogo      |  mailcowdockerized_sogo-mailcow_1
  clamd     |  mailcowdockerized_clamd-mailcow_1
  rspamd    |  mailcowdockerized_rspamd-mailcow_1
  acme      |  mailcowdockerized_acme-mailcow_1
  php-fpm   |  mailcowdockerized_php-fpm-mailcow_1
  netfilter |  mailcowdockerized_netfilter-mailcow_1
  ipv6nat   |  mailcowdockerized_ipv6nat-mailcow_1
  memcached |  mailcowdockerized_memcached-mailcow_1
  unbound   |  mailcowdockerized_unbound-mailcow_1
  dockerapi |  mailcowdockerized_dockerapi-mailcow_1
  watchdog  |  mailcowdockerized_watchdog-mailcow_1
  redis     |  mailcowdockerized_redis-mailcow_1
  ofelia    |  mailcowdockerized_ofelia-mailcow_1
  olefy     |  mailcowdockerized_olefy-mailcow_1
  solr      |  mailcowdockerized_solr-mailcow_1
      "
    ;;

esac
