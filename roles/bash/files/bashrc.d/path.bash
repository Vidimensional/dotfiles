# This file is meant to be sourced from bashrc


case `uname -s` in
    Linux)
        PATH="${PATH}:${HOME}/.local/bin"
        PATH="${PATH}:/snap/bin"
        ;;
esac

export PATH
