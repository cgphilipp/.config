#!/usr/bin/env bash

conn=$(nmcli c show --active | grep wireguard | cut -d " " -f1)
if [[ -z "$conn" ]]; then
	echo "None"
else
	echo $conn
fi
