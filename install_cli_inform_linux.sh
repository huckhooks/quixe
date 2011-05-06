#!/bin/sh

# i prefer non-root installed 
# download and install in ~/Inform
# delete ~/Inform/download-cli-inform later if you really need diskspace

set -ue

mkdir -p ~/Inform/download-cli-inform
cd ~/Inform/download-cli-inform
wget -c http://inform7.com/download/content/6G60/I7_6G60_Linux_all.tar.gz
tar -xzf I7_6G60_Linux_all.tar.gz
cd inform7-6G60
mkdir -p ~/Inform/cli-inform
./install-inform7.sh --prefix ~/Inform/cli-inform
ls ~/Inform




