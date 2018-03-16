#!/bin/bash

setup_osx() {
    set -e
    tools/install-packages.sh
    tools/setup-repos.sh
}

case `uname -s` in
    Darwin)
        setup_osx
        ;;
    *)
        echo "Unknown platform, exiting!!"
        exit 1
        ;;
esac
