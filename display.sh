#!/bin/sh
xrandr  | awk '/ connected / { print "xrandr --output " $1 " --auto" }' | sh
xrandr --output VGA1 --left-of LVDS1
