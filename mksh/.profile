#
# ~/.profile
#

# shell settings
export SHDIR="${SHDIR:-$HOME/etc/sh.d}"

# set environment variables
[[ -e "$SHDIR/environment" ]] && . $SHDIR/environment

# start X
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec xinit -- vt1 -keeptty &>/dev/null
    logout
fi

# vim: set ft=sh :
