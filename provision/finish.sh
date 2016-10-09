#! /usr/bin/env bash

echo "====> Package cleaning"
sudo apt-get autoremove -y
sudo apt-get autoclean -y
sudo apt-get autoclean -y
updatedb
sudo rm -Rf /root/VBoxGuestAdditions.iso
