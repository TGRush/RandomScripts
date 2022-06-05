#!/bin/bash

# A simple little script I made, because I didn't want to install OpenAsar myself :)

currentRelease="https://github.com/GooseMod/OpenAsar/releases/latest/download/app.asar"

flatpakInstall() {
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

tui() {
    clear
    echo "Make your selection below:"
    echo "1 - Flatpak"
    echo "2 - Native (deb,rpm,etc)"
    read -r -p "Your Selection ==> " tuiinput
    case $tuiinput in
        1)
            flatpakInstall
            ;;
        2)
            nativeInstall
            ;;
        *)
            echo "that is not a valid option!"
            echo "try again..."
            sleep 5s
            tui
            ;;
    esac
}

case $1 in
    -t)
        tui
        ;;
    *)
        echo "use -t to enter a terminal UI"
        ;;
esac
