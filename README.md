# .config
Documenting my hyprland dotfiles here so I can recreate it when distro hopping or when my setup inevitably dies :)

## arch packages

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
| **login manager** | greetd + greetd-tuigreet |

## greetd setup

`/etc/greetd/config.toml`
```
[terminal]
vt = 1

[default_session]
command = "tuigreet --remember --remember-session"
user = "greeter"
```

## uwsm

More info about systemd and session management: https://wiki.hyprland.org/Useful-Utilities/Systemd-start/

The gist of it is that wayland session types are stored in `/usr/share/wayland-sessions` and will be parsed by session managers.
Alternatively it's possible to start a session with `uwsm start` manually.
