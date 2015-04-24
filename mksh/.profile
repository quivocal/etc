#
# ~/.profile
#

. ~/.mkshrc

export CHARSET="UTF-8"
export ENV="$HOME/.profile"
export HISTFILE="$HOME/.mksh_history"
export LC_ALL=
export LC_COLLATE="C"
export GPG_TTY=$(tty)
export PASSWORD_STORE_DIR="$HOME/usr/sync/pass"

path=($HOME/bin)
case ":$PATH:" in
	*":$path:"*) :;; # already there
	*) PATH="$path:$PATH";;
esac

# default dirs
[[ $XDG_CONFIG_HOME ]] || export XDG_CONFIG_HOME="$HOME/.config"

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
fi

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec xinit -- vt1 -keeptty &>/dev/null
    logout
fi
