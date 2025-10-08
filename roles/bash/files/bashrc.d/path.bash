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

        PATH="${PATH}:/usr/local/opt/php@7.4/bin"
        PATH="${PATH}:/usr/local/opt/mysql-client/bin"
        PATH="${PATH}:/usr/local/opt/libpq/bin"
        ;;
esac

export PATH
