#!/bin/bash

# A script to install VSCodium, mostly just copy/paste from official website, abandoned as I now use Micro or Elementary's code editor

debian() {
    wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg |
        gpg --dearmor |
        sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

    echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' |
        sudo tee /etc/apt/sources.list.d/vscodium.list

    sudo apt update && sudo apt install codium -y
    exit 0
}

rmdebian() {
    sudo apt purge codium -y
    sudo rm /usr/share/keyrings/vscodium-archive.keyring.gpg
    rm -rf /etc/apt/sources.list.d/vscodium.list
    sudo apt update
    exit 0
}

if [ -n "$1" ]; then
    case "$1" in
    --install-debian)
        debian
        ;;
    --remove-debian)
        rmdebian
        ;;
    *)
        echo "tf u doin, that's not an argument!?"
        ;;
    esac
    shift
else
    echo "give some actual arguments m8"
fi
