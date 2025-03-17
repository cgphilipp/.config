# .config
Documenting my hyprland dotfiles and other packages I use here, so I can recreate my system when distro hopping or when my setup inevitably dies :)

## hyprland + adjacent software (arch packages)

| | |
|-|-|
| **window manager** | hyprland |
| **terminal** | alacritty |
| **status bar** | waybar |
| **app launcher** | fuzzel |
| **wallpaper** | hyprpaper |
| **lockscreen** | hyprlock |
| **idle daemon** | hypridle |
| **notification daemon** |	swaync |
| **session manager** | uwsm |
| **authentication agent** | hyprpolkitagent |
| **login manager** | greetd + greetd-tuigreet |

## other software (arch packages)

| | |
|-|-|
| **shell** | zsh + oh-my-zsh |
| **terminal fuzzy finder** | fzf + [fzf-tab](https://github.com/Aloxaf/fzf-tab) |
| **snapshots** | snapper + snap-pac + grub-btrfs + snap-pac-grub |
| **backups** | borg |
| **password manager** | keepassxc |

My .zshrc is checked in here so it can easily be used after cloning with
```
ln -s ~/.config/.zshrc ~/.zshrc
```

## greetd setup

`/etc/greetd/config.toml`
```
[terminal]
vt = 5

[default_session]
command = "tuigreet --remember --remember-session"
user = "greeter"
```

## uwsm

More info about systemd and session management: https://wiki.hyprland.org/Useful-Utilities/Systemd-start/

The gist of it is that wayland session types are stored in `/usr/share/wayland-sessions` and will be parsed by session managers.
Alternatively it's possible to start a session with `uwsm start` manually.

## snapper config

`/etc/snapper/configs/root`, see https://wiki.archlinux.org/title/Snapper
```
# subvolume to snapshot
SUBVOLUME="/"

# filesystem type
FSTYPE="btrfs"


# btrfs qgroup for space aware cleanup algorithms
QGROUP=""


# fraction or absolute size of the filesystems space the snapshots may use
SPACE_LIMIT="0.3"

# fraction or absolute size of the filesystems space that should be free
FREE_LIMIT="0.2"


# users and groups allowed to work with config
ALLOW_USERS=""
ALLOW_GROUPS=""

# sync users and groups from ALLOW_USERS and ALLOW_GROUPS to .snapshots
# directory
SYNC_ACL="no"


# start comparing pre- and post-snapshot in background after creating
# post-snapshot
BACKGROUND_COMPARISON="yes"


# run daily number cleanup
NUMBER_CLEANUP="yes"

# limit for number cleanup
NUMBER_MIN_AGE="3600"
NUMBER_LIMIT="50"
NUMBER_LIMIT_IMPORTANT="10"


# create hourly snapshots
TIMELINE_CREATE="yes"

# cleanup hourly snapshots after some time
TIMELINE_CLEANUP="yes"

# limits for timeline cleanup
TIMELINE_MIN_AGE="3600"
TIMELINE_LIMIT_HOURLY="0"
TIMELINE_LIMIT_DAILY="4"
TIMELINE_LIMIT_WEEKLY="4"
TIMELINE_LIMIT_MONTHLY="4"
TIMELINE_LIMIT_QUARTERLY="0"
TIMELINE_LIMIT_YEARLY="0"


# cleanup empty pre-post-pairs
EMPTY_PRE_POST_CLEANUP="yes"

# limits for empty pre-post-pair cleanup
EMPTY_PRE_POST_MIN_AGE="3600"
```
