IP=$(cat /ip.txt)
sed -i "s/AAAIPAAA/$IP/g" /var/www/wordpress/wp-config.php
php -S 0.0.0.0:5050 -t /var/www/wordpress
/usr/bin/supervisord -c /etc/supervisord.conf
