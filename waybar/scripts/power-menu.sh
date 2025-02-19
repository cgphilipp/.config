#!/usr/bin/env bash

# actions=$(echo -e "  Shutdown\n  Reboot\n  Lock\n  Suspend\n  Hibernate")
actions=$(echo -e "Shutdown\nReboot\nLock\nSuspend\nHibernate")

# Display logout menu
selected_option=$(echo -e "$actions" | fuzzel -d -w 12 -l5 -a top-right --x-margin=0 --y-margin=0 -f "monospace" || pkill -x fuzzel)

# Perform actions based on the selected option
case "$selected_option" in
*Lock)
  hyprlock
  ;;
*Shutdown)
  systemctl poweroff
  ;;
*Reboot)
  systemctl reboot
  ;;
*Suspend)
  systemctl suspend
  ;;
*Hibernate)
  systemctl hibernate
  ;;
esac
