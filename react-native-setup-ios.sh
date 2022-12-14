#!/bin/bash

# exit when any command fails
set -e

COMMAND=$1

function clean() {
    printf "๐งน Cleaning.. \n"
    rm -rf ~/Library/Caches/CocoaPods Pods ~/Library/Developer/Xcode/DerivedData
    rm -rf node_modules ios/build ios/Pods ios/Podfile.lock
    yarn cache clean
    printf "โ Cleaning finished! \n"
}

function install_dependencies() {
    printf "๐จโ๐ป Installing dependencies.. \n"
    yarn
    npx pod-install
    printf "โ All installed correctly"
}

function setup_environment() {
    clean
    install_dependencies
}

case $COMMAND in
clean) clean ;;
install) install_dependencies ;;
setup) setup_environment ;;
*) echo "โ Command not found" ;;
esac