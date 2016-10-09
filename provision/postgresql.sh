#! /usr/bin/env bash
# Script from https://github.com/jackdb/pg-app-dev-vm/blob/master/Vagrant-setup/bootstrap.sh

sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get -y install "postgresql-$PG_DB_VERSION" "postgresql-contrib-$PG_DB_VERSION"

PG_CONF="/etc/postgresql/$PG_DB_VERSION/main/postgresql.conf"
PG_HBA="/etc/postgresql/$PG_DB_VERSION/main/pg_hba.conf"
PG_DIR="/var/lib/postgresql/$PG_DB_VERSION/main"

# Edit postgresql.conf to change listen address to '*':
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF"

# Append to pg_hba.conf to add password auth:
echo "host    all             all             all                     md5" >> "$PG_HBA"

# Explicitly set default client_encoding
echo "client_encoding = utf8" >> "$PG_CONF"

# Restart so that all new config is loaded:
service postgresql restart

cat << EOF | su - postgres -c psql
-- Create the database user:
CREATE USER $PG_DB_USER WITH PASSWORD '$APP_DB_PASS';

-- Create the database:
CREATE DATABASE $PG_DB_NAME WITH OWNER=$PG_DB_USER
                                  LC_COLLATE='en_US.utf8'
                                  LC_CTYPE='en_US.utf8'
                                  ENCODING='UTF8'
                                  TEMPLATE=template0;
EOF
