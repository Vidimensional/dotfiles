# This file is meant to be sourced from bashrc


case `uname -s` in
    Linux)
        PATH="${PATH}:${HOME}/.local/bin"
        PATH="${PATH}:/snap/bin"
        ;;
    
    Darwin)
        # TODO Delete this
        # export GOROOT="/usr/local/opt/go/libexec"
        # PATH="${PATH}:${GOPATH}/bin:${GOROOT}/bin"

        # Add GNU coreutils manpages to $MANPATH.
        export MANPATH=":$MANPATH:/usr/local/opt/coreutils/libexec/gnuman"

        # Add GNU tools $PATH (override BSD ones).
        PATH="${PATH}:/usr/local/opt/coreutils/libexec/gnubin"
        PATH="${PATH}:/usr/local/opt/grep/libexec/gnubin"
        PATH="${PATH}:/usr/local/opt/gnu-sed/libexec/gnubin"

        PATH="${PATH}:/usr/local/opt/php@7.4/bin"
        PATH="${PATH}:/usr/local/opt/mysql-client/bin"
        PATH="${PATH}:/usr/local/opt/libpq/bin"
        ;;
esac

export PATH
