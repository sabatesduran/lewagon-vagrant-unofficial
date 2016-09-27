#! /usr/bin/env bash

echo "====> Package cleaning"
apt-get autoremove -y
apt-get autoclean -y
apt-get clean -y
updatedb
rm -Rf /root/VBoxGuestAdditions.iso
