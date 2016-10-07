#! /usr/bin/env bash

echo "====> Changing system timezone"
echo "Europe/Amsterdam " > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata
echo ""

echo "====> Update package list"
apt-get update -y
apt-get dist-upgrade -y

echo "====> Installing required packages"
apt-get -y install build-essential software-properties-common python-software-properties
apt-get -y install vim curl git expect sshpass rsync unzip curl wget jq imagemagick dos2unix
echo ""
