#!/bin/sh

set -x

mkdir -p ~/repos/{personal,work,opensource}

for i in $(cat repos); do
    (cd ~/repos/personal;
     if [ ! -d $(basename $i) ]; then
	 git clone https://github.com/$i
     fi)
done
