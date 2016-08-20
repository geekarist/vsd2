#!/bin/bash

set -eu

test "$(id -un)" = "root" || { echo Should be run as root ; exit 1 ; }

while :; do
	sleep 10
	mylocation=$(curl -Ss wtfismyip.com/json | jq -r .YourFuckingLocation)

	if echo "$mylocation" | grep -q "Netherlands"; then
		echo "$(date): They think we're in $mylocation: making sure the torrent service is started..."
		servicestatus=$(service transmission-daemon status)
		if !(echo "$servicestatus" | grep -q 'start/running'); then
			service transmission-daemon start
		fi
	else
		echo "$(date): They think we're in $mylocation: stopping the torrent service..."
		servicestatus=$(service transmission-daemon status)
		if (echo "$servicestatus" | grep -q 'start/running'); then
			service transmission-daemon stop
		fi
	fi
done
