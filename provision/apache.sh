#! /usr/bin/env bash

echo "====> Inatalling Apache2"
apt-get -y install apache2 libapache2-mod-python libapache2-mod-perl2 mcrypt
echo ""

echo "====> Overwrite permisions for apache"
sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
echo ""

echo "====> Restart Apache"
service apache2 restart
echo ""