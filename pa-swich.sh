#!/bin/sh

# Very simple script, that switches the output of all running application to
# another device.
#
# I use this to switch my browser between my Desktop and TV.

SINKS=`pactl list sinks short | awk '{ print $1 }'`
SINKS_COUNT=`echo $SINKS | wc -w`
INPUTS=`pactl list sink-inputs short | awk '{ print $1 }'`
CURRENT=`pactl list sink-inputs short | awk 'NR == 1 { print $2 }'`

if [ -z "$CURRENT" ]; then
	echo "No sink-inputs available."
	exit 0
fi

if [ $SINKS_COUNT -lt 2 ]; then
	echo "Not enough sinks to switch."
	exit 0
fi

# TODO think up something smarter 
for SINK in $SINKS; do
	if [ $SINK != $CURRENT ]; then
		NEXT=$SINK
	fi
done

for INPUT in $INPUTS; do
	pactl move-sink-input $INPUT $NEXT
done
