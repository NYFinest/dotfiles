#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# set fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# acpid restart
sudo /etc/rc.d/acpid restart &

# start network
wicd-client &
{
	sleep 4
	sh ~/.fehbg
} &
exec ck-launch-session dbus-launch /usr/bin/subtle
