#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
comptoncfg=$HOME/etc/compton/compton.conf

# merge in defaults and keymaps

if [ -f "$sysresources" ]; then
  xrdb -merge "$sysresources"
fi

if [ -f "$sysmodmap" ]; then
  xmodmap "$sysmodmap"
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# font paths
xset +fp /usr/share/fonts/local
xset fp rehash

# restart X
setxkbmap -option terminate:ctrl_alt_bksp

# set cursor
xsetroot -cursor_name left_ptr &

# hide cursor
#xbanish &

# remap capslock
setxkbmap -option caps:escape

# wallpaper
setroot --restore 2>/dev/null

# start gpg agent
echo BYE | gpg-connect-agent

# urxvtd
urxvtd -q -o -f

# compositor
compton --config $comptoncfg -b

# touchpad typing disable
syndaemon -k -i 0.5 -d

# sxhkd
sxhkd &

# bspwm
exec bspwm
