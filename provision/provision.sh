#! /usr/bin/env bash

# Variables
source /vagrant/provision/variables.sh

echo ""
echo "====> Root login"
sudo su
echo ""

# ISystem upgrade and system packages
source $PROVISION_SCRIPTS/system.sh

# Herramientas y entorno de desarrollo
source $PROVISION_SCRIPTS/develop.sh

# Node.js
source $PROVISION_SCRIPTS/nodejs.sh

# Mailcatcher (WIP)
#source $PROVISION_SCRIPTS/mailcatcher.sh

# Ruby
source $PROVISION_SCRIPTS/ruby.sh

# Apache 2
source $PROVISION_SCRIPTS/apache.sh

# ZSH
source $PROVISION_SCRIPTS/zsh.sh

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
#echo "     Mailcatcher access: http://lewagon.local:1080"
#echo ""
#echo "     PostgreSQL access:"
#echo "       User: root"
#echo "       Password: vagrant"
echo ""
echo "     Terminal ssh access: vagrant ssh"
echo ""
echo "     Putty ssh access: vagrant putty"
echo ""
echo "******************************************************************************************"
echo ""
