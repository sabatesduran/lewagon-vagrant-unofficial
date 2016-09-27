#! /usr/bin/env bash

echo "====> MailCatcher install"
# Install Mailcatcher gem
gem install mailcatcher

# Start mailcatcher on every reboot
echo "@reboot root $(which mailcatcher) --ip=0.0.0.0" >> /etc/crontab
update-rc.d cron defaults

# Start Mailcatcher
/usr/bin/env $(which mailcatcher) --ip=0.0.0.0
echo ""
