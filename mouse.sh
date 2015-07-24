#!/bin/sh
ID=`xinput | awk '/Optical Mouse/ { match($0, /id=([0-9]+)/, a ); print a[1] }'`
xinput set-button-map $ID 3 2 1
