#!/bin/bash

case "$1" in

    postfix)
        docker logs mailcowdockerized_postfix-mailcow_1
    ;;

    rspamd)
        docker logs mailcowdockerized_rspamd-mailcow_1
    ;;

    acme)
        docker logs mailcowdockerized_acme-mailcow_1
    ;;

    nginx)
        docker logs mailcowdockerized_nginx-mailcow_1
    ;;

    php-fpm)
        docker logs mailcowdockerized_php-fpm-mailcow_1
    ;;

    dovecot)
        docker logs mailcowdockerized_dovecot-mailcow_1
    ;;

    netfilter)
        docker logs mailcowdockerized_netfilter-mailcow_1
    ;;

    ipv6nat)
        docker logs mailcowdockerized_ipv6nat_1
    ;;

    sogo)
        docker logs mailcowdockerized_sogo-mailcow_1
    ;;

    clamd)
        docker logs mailcowdockerized_clamd-mailcow_1
    ;;

    mysql)
        docker logs mailcowdockerized_mysql-mailcow_1
    ;;

    memcached)
        docker logs mailcowdockerized_memcached-mailcow_1
    ;;

    unbound)
        docker logs mailcowdockerized_unbound-mailcow_1
    ;;

    dockerapi)
        docker logs mailcowdockerized_dockerapi-mailcow_1
    ;;

    watchdog)
        docker logs mailcowdockerized_watchdog-mailcow_1
    ;;

    redis)
        docker logs mailcowdockerized_redis-mailcow_1
    ;;

    --all|all)
        mypath=$(pwd)
        cd /root/dev/mailcow-dockerized
        source mailcow.conf
        docker-compose logs
    ;;

    -h|--help|help|*|?)
      echo
      echo "Usage: $0 [filter|all|--help]"
      echo "

Filters   |  Containers
----------+-----------------------------------------
all       |  print all containers
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
      "
    ;;

esac
