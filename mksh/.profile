#
# ~/.profile
#

. ~/.mkshrc

export CHARSET="UTF-8"
export ENV="$HOME/.profile"
export HISTFILE="$HOME/.mksh_history"
export LC_ALL=

path=($HOME/bin)

case ":$PATH:" in
	*":$path:"*) :;; # already there
	*) PATH="$path:$PATH";;
esac

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec xinit -- vt1 -keeptty &>/dev/null
    logout
fi
