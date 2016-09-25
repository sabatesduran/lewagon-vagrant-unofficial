#! /usr/bin/env bash

echo "====> Instalamos NodeJS y NPM"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs
echo ""

echo "====> Instalamos Gulp"
npm install -g gulp