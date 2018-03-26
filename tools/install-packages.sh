#!/bin/sh

do_osx() {
    set -e

    [ -f /usr/local/bin/brew ] || tools/osx/install-brew.sh

    while read i; do
	echo "Installing $i"
	brew install $i
    done < packages/osx
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
