#!/bin/bash

do_osx() {
    set -e

    config_scripts=config/osx

    for i in $(ls -1 $config_scripts); do
	cmd="${config_scripts}/$i"
	echo "Running $cmd"
    done
}

case `uname -s` in
    Darwin)
        do_osx
        ;;
    *)
        echo "Unknown platform, exiting!!"
        exit 1
        ;;
esac
