#!/bin/sh

defaults write com.apple.menuextra.clock DateFormat -string 'EEE MMM d  HH:mm:ss'

killall -HUP SystemUIServer
