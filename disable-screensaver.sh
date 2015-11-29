#!/bin/sh
if command -v gsettings > /dev/null; then
	#gsettings set org.gnome.desktop.screensaver idle-activation-enabled false
	gsettings set org.gnome.desktop.session idle-delay 0
fi

xset s off
