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

# start trayfreq
trayfreq &
# apps that need delays
{
	sleep 3
	~/dzconky 
	
} &
{
	sleep 4
	/home/edwin/Wallpapers/wallpaper.sh
} &
/usr/bin/nm-applet --sm-disable &
exec  /usr/bin/subtle
