#!/bin/bash
#we need a check wether or not the db is ok
sleep 20
#check if nexcloud is configured...
cd /usr/share/nextcloud
sudo -u www-data php occ check|grep "Nextcloud is not installed"
if [ $? -eq 0 ];then
	echo "configure owncloud...."
	sudo -u www-data php occ maintenance:install --database "mysql" --database-host ${MYSQL_HOST} \
--database-name `cat /run/secrets/mysql_db_name`  --database-user `cat /run/secrets/mysql_user` --database-pass `cat /run/secrets/mysql_password` \
--admin-user "sladmin" --admin-pass "password" --data-dir /var/lib/nextcloud
fi
/etc/init.d/php7.0-fpm start
/usr/sbin/nginx -t -c /etc/nginx/nginx.conf
/usr/sbin/nginx -c /etc/nginx/nginx.conf
tail -f /var/log/nginx/access.log /var/log/nginx/error.log 

