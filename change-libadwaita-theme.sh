#!/bin/bash

############################
# LibAdwaita Theme Changer #
# by TGRush                #
############################

configDir="$HOME/.config"
themesDir="$HOME/.themes"

change() {
	echo "Select a theme:"
	ls "$themesDir"
	echo "(write full theme name, case-sensitive)"
	read -r -p "Your selection >>> " themeSelection
	if [ -n "$themeSelection" ]; then
		echo "Selected Theme: $themeSelection"
		echo "removing previous theme..."
		rm -rf "$configDir/gtk-4.0/gtk.css"
		rm -rf "$configDir/gtk-4.0/gtk-dark.css"
		rm -rf "$configDir/gtk-4.0/assets"
		rm -rf "$configDir/assets"
		ln -s "$themesDir/$themeSelection/gtk-4.0/gtk.css" "$configDir/gtk-4.0/gtk.css"
		ln -s "$themesDir/$themeSelection/gtk-4.0/gtk-dark.css" "$configDir/gtk-4.0/gtk-dark.css"
		ln -s "$themesDir/$themeSelection/gtk-4.0/assets" "$configDir/gtk-4.0/assets"
		ln -s "$themesDir/$themeSelection/assets" "$configDir/assets"
		echo "All done! you might need to restart some applications."
	else
		echo "no theme given!"
		exit 0;
	fi
}

reset() {
	echo "resetting theme..."
	rm -rf "$configDir/gtk-4.0/gtk.css"
	rm -rf "$configDir/gtk-4.0/gtk-dark.css"
	rm -rf "$configDir/gtk-4.0/assets"
	rm -rf "$configDir/assets"
	echo "All done! you might need to restart some applications."
}

flatpakSupport() {
	echo "Are you sure you want to enable Flatpak support?"
	echo "This will add some overrides to Flatpak's configuration."
	read -r -p "[Y/n] >> " flatpakInput
	case $flatpakInput in
		[Yy])
			flatpak override --filesystem=~/.themes:ro
			flatpak override --filesystem=xdg-config/gtk-4.0:ro
			flatpak override --filesystem=xdg-config/gtk-3.0:ro
			flatpak override --filesystem=/usr/share/themes:ro
			;;
		*)
			echo "ABORTING!"
			exit 0
			;;
}

help() {
    echo "Usage: $0 [--options]"
    echo "example: $0 --help"
    echo "available options:"
    echo "--help            shows this help page"
    echo "--reset           reverts the theming"
    echo "--fp              sets up Flatpak overrides"
}

if [ -n "$1" ]; then
	case $1 in
		--help)
			help;;
		-h)
			help;;
		--reset)
			reset;;
		--fp)
		    flatpakSupport;;
	esac
else
	change
fi
