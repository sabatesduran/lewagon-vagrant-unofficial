#! /usr/bin/env bash

echo "====> Installing NodeJS and npm"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs
echo ""

echo "====> Installing Gulp"
npm install -g gulp