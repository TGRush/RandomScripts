#!/bin/bash

debian() {
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

sudo apt update && sudo apt install codium -y
}

removedebian() {
    sudo apt purge codium -y
}

if [ -n "$1" ]; then
    case "$1" in
    --install-debian)
    debian
    ;;
    --remove-debian
    removedebian
    ;;
    *)
    echo "tf u doin, that's not an argument!?"
    ;;
    esac
    shift
else
    echo "give some actual arguments m8"
fi