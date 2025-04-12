#!/usr/bin/env bash

# ensure that network is up
for i in {1..30}; do
    ping -c1 8.8.8.8 &>/dev/null && break
    sleep 1
done

notify-send -a protondrive "Syncing proton..."
SECONDS=0
rclone bisync protoncloud:/drive /media/protoncloud/ --create-empty-src-dirs --compare size,modtime,checksum --slow-hash-sync-only --resilient -MvP --drive-skip-gdocs --fix-case 
if [ $? -ne 0 ]; then
    notify-send -a protondrive "Proton sync failed" "An error occured during rclone bisync."
else
    notify-send -a protondrive "Sync done in ${SECONDS}s"
fi
