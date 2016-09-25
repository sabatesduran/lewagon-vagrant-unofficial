#! /usr/bin/env bash

echo "====> MailCatcher install"
# Dependencias de mailcatcher
apt-get -y install rubygems ruby-dev libsqlite3-dev

# Instalar Mailcatcher gem
gem install mailcatcher

# Iniciar mailcatcher
echo "@reboot root $(which mailcatcher) --ip=0.0.0.0" >> /etc/crontab
update-rc.d cron defaults

# Start Mailcatcher
/usr/bin/env $(which mailcatcher) --ip=0.0.0.0
echo ""