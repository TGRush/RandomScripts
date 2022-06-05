#!/bin/bash

# A simple little script I made, because I didn't want to install OpenAsar myself :)

currentRelease="https://github.com/GooseMod/OpenAsar/releases/latest/download/app.asar"

flatpak() {
    wget "$currentRelease" || (echo "Something went wrong in the Download!" ; exit 0;)
    sudo mv app.asar $(flatpak info -l com.discordapp.Discord)/files/discord/resources/app.asar
    echo "==> All Done!"
    exit 0;
}

# deb, rpm, pacman, AUR, etc...
native() {
    echo "Not implemented!"
    exit 1;
}
