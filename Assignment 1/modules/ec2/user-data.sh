#!/bin/bash
apt-get update -y
apt-get install -y apache2 php php-mysql mysql-client wget unzip

systemctl enable apache2
systemctl start apache2

cd /var/www/html
rm -f index.html

wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -R wordpress/* .
rm -rf wordpress latest.tar.gz

chown -R www-data:www-data /var/www/html
find /var/www/html -type d -exec chmod 755 {} \;
find /var/www/html -type f -exec chmod 644 {} \;