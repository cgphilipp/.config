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