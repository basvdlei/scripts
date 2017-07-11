#!/bin/sh

# i'd like some more colors :-)
if [ $TERM = "xterm" ]; then
	TERM=gnome-256color
	export TERM
fi

# use a nice dark theme
if [ -f /usr/share/themes/Xfce-dusk/gtk-2.0/gtkrc ]; then
	GTK2_RC_FILES=/usr/share/themes/Xfce-dusk/gtk-2.0/gtkrc
	export GTK2_RC_FILES
fi

if [ $SHELL = "/bin/bash" ]; then
	# tabs should always be 8 chars
	tabs 8
fi

# make libvirt always use kvm
LIBVIRT_DEFAULT_URI=qemu:///system
export LIBVIRT_DEFAULT_URI

# start vim in nocp mode
alias vi=vim

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

GOROOT=/usr/local/go; export GOROOT
PATH=$PATH:$GOROOT/bin; export PATH
GOPATH=$HOME/go; export GOPATH
PATH=$PATH:$GOPATH/bin; export PATH
