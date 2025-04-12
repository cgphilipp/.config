#!/usr/bin/env bash

# ensure that network is up
for i in {1..30}; do
    ping -c1 8.8.8.8 &>/dev/null && break
    sleep 1
done

# load borg variables from .env file
set -a
. ./.env
set +a

notify-send -a backup "Starting borg backup job!"

repopath="/media/storagebox/backups/arch-home"
encryption="repokey"
compression="auto,zstd,3"
pruning="--keep-within=1d --keep-daily=7 --keep-weekly=4 --keep-monthly=12"

folders="
/home 
-e /home/*/.cache
-e /home/*/.ccache
-e /home/*/.cargo
-e /home/*/.rustup
-e /home/*/.npm
-e /home/*/.lldb
-e /home/*/.mozilla
-e /home/*/.thunderbird
-e /home/*/.steam
-e /home/*/.BurpSuite
-e /home/*/.vscode-oss 
-e /home/*/.config/Code*
-e /home/*/.config/discord
-e /home/*/.local
-e /home/*/node_modules
"

# # Init borg-repo if absent
# if [ ! -d $repopath ]; then
#   borg init --encryption=$encryption $repopath. 
#   echo "Created $repopath"
# fi

echo "=== Backup starting at $(date) ==="

SECONDS=0
borg create --debug --compression $compression --exclude-caches --one-file-system -v --stats --progress \
            $repopath::'{hostname}-{now:%Y-%m-%d-%H%M%S}' $folders

if [ $? -ne 0 ]; then
    notify-send -a backup "Borg create failed" "An error occured during borg create for arch-home."
fi

echo "Finished backup $(date)"
date -ud "@$SECONDS" "+Backup time: %Hh %Mm %Ss"

echo "=== Pruning ==="

SECONDS=0
borg prune -v --list $repopath $pruning
echo "Finished pruning"
date -ud "@$SECONDS" "+Pruning time: %Hh %Mm %Ss"

notify-send -a backup "Finished backup job in ${SECONDS}s"

