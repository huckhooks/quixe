#!/bin/sh

#stop on errors, allow files with spaces
set -ue
IFS="
"

dir=$(dirname $0)
ls $dir/*.inform -d
rm -fv $dir/*.inform/Index/World.html
rm -fv $dir/*.inform/Index/Phrasebook.html
rm -fv $dir/*.inform/Index/Kinds.html
rm -fv $dir/*.inform/Index/Details/*


