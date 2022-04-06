#!/bin/bash

core() {
    sudo apt remove -y --auto-remove gnome-{sudoku,mines,mahjongg,maps,sound-recorder,todo,weather} *quadrapassel* aisleriot brasero remmina gimp *libreoffice* evolution rhythmbox pitivi cheese
}

lite() {
    sudo apt remove -y --auto-remove gnome-{sudoku,mines,mahjongg,maps,sound-recorder,weather} *quadrapassel* aisleriot xfburn remmina gimp *libreoffice* evolution rhythmbox pitivi cheese
}

if [ -n "$1" ]; then
    case "$1" in
    --core)
    core
    ;;
    --lite)
    lite
    ;;
    esac
    shift
else
    echo 'ayo u got no arguments :|'
fi