#!/bin/bash

# This removes a lot of pre-installed programs on ZorinOS, to attempt to resemble a "Minimal" install. Kind of like on Ubuntu

core() {
    sudo apt remove -y --auto-remove gnome-{sudoku,mines,mahjongg,maps,sound-recorder,todo,weather} *quadrapassel* aisleriot brasero remmina gimp *libreoffice* evolution rhythmbox pitivi cheese
}

lite() {
    sudo apt remove -y --auto-remove gnome-{sudoku,mines,mahjongg,maps,sound-recorder,weather} *quadrapassel* aisleriot xfburn remmina gimp *libreoffice* evolution rhythmbox pitivi cheese
}

help() {
	echo "Syntax: $0 --arguments"
	echo "Available arguments:"
	echo "--help		Show this help page"
	echo "--core		Minimalise the Core edition of Zorin"
	echo "--lite		Minimalise the Lite edition of Zorin"
}

if [ -n "$1" ]; then
    case "$1" in
    --core)
        core
        ;;
    --lite)
        lite
        ;;
    --help)
    	help
    	;;
    esac
    shift
else
    echo 'use --help to see available options'
fi
