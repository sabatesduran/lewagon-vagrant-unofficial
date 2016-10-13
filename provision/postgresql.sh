#! /usr/bin/env bash
# Script from https://github.com/jackdb/pg-app-dev-vm/blob/master/Vagrant-setup/bootstrap.sh

sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get -y install "postgresql-$PG_DB_VERSION" "postgresql-contrib-$PG_DB_VERSION"
