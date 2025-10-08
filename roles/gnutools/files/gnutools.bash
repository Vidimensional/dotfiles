# This file is meant to be sourced from bashrc

# Add GNU tools $PATH (override BSD ones).
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:${PATH}"
PATH="/opt/homebrew/opt/gawk/libexec/gnubin:${PATH}"
PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:${PATH}"
PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:${PATH}"

# Add GNU coreutils manpages to $MANPATH.
export MANPATH=":$MANPATH:/usr/local/opt/coreutils/libexec/gnuman"

export PATH
