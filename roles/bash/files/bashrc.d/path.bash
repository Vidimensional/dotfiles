# This file is meant to be sourced from bashrc

PATH="${PATH}:${HOME}/.local/bin"

[ "$( uname -s )" == Linux ] && PATH="${PATH}:/snap/bin"

export PATH
