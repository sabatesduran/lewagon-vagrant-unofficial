#! /usr/bin/env bash

# Variables
source /vagrant/provision/variables.sh

# System upgrade and system packages
source $PROVISION_SCRIPTS/system.sh

# ZSH
# source $PROVISION_SCRIPTS/zsh.sh

# Ruby
source $PROVISION_SCRIPTS/ruby.sh

# Mailcatcher
source $PROVISION_SCRIPTS/mailcatcher.sh

# Node.js
source $PROVISION_SCRIPTS/nodejs.sh

# Postresql
source $PROVISION_SCRIPTS/postgresql.sh

# Apache 2 (Doesn't know if it's necessary)
# source $PROVISION_SCRIPTS/apache.sh

# Cleaning
source $PROVISION_SCRIPTS/finish.sh

echo ""

echo "*****************************************************************************************"
echo ""
echo "     Le Wagon VM created"
echo "     -------------------------------------------------------------------------------"
echo ""
echo "     Hostname: lewagon.local"
echo ""
echo "     Mailcatcher access: http://lewagon.local:1080"
echo ""
echo "     PostgreSQL access:"
echo "       User: lewagon"
echo "       Password: password"
echo ""
echo "     Terminal ssh access: vagrant ssh"
echo ""
echo "     Putty ssh access: vagrant putty"
echo ""
echo "******************************************************************************************"
echo ""

# Required reboot
sudo reboot
