#!/bin/sh

# i prefer non-root installed 
# download and install in ~/Inform
# delete download-cli-inform later if you really need diskspace

#stop on errors, allow files with spaces
set -ue
IFS="
"

project=$(dirname $0)
cd $project
ls

mkdir -p ~/Downloads
cd ~/Downloads
wget -c http://inform7.com/download/content/6G60/I7_6G60_Linux_all.tar.gz
tar -xzf I7_6G60_Linux_all.tar.gz
cd inform7-6G60
mkdir -p ~/Inform/cli-inform
./install-inform7.sh --prefix ~/Inform/cli-inform

mkdir -p ~/Inform/Extensions

ls ~/Inform




