# mailcow-tools
a couple of bunch helper scripts to manage mailcow-dockerized

## cleanup_after_upgrade.sh

It's a smaller script to cleanup further garbage collected after using the orignal update.sh by mailcow.

## dbconnect.sh	

With dbconnect you can connect directly to the mysql database from the mysql container.

## dockerstatus.sh

Shows an overview of all running Docker instances and you can see how many are not started.

## logdock.sh [filter|all|--help]

Simplifies the log output of individual or all containers.

## sender_login_maps_update.sh

Simplifies editing postfix sender login maps to allows the sender and return address to be different.

## sender_reject_update.sh

Simplifies editing postfix sender reject maps to block special email sender or sender domains.

## sslcert_update.sh

If you want to generate the SSL certificate via Letsencrypt (Certbot) then you need the SSL Update Cert Script.
This simplifies the process after a certbot renew.
