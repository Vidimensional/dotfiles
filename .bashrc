
################################################################################
#
# Define prompt
#
PS_RED="\[\033[01;31m\]"
PS_GREEN="\[\033[01;32m\]"
PS_YELLOW="\[\033[01;33m\]"
PS_BLUE="\[\033[01;34m\]"
PS_DEFAULT="\[\033[00m\]"

if [ ${UID} -eq 0 ]; then
    PS1="${PS_RED}\u${PS_DEFAULT}@${PS_YELLOW}\h${PS_DEFAULT}:${PS_BLUE}\w${PS_DEFAULT}\$ "
else
    PS1="${PS_GREEN}\u${PS_DEFAULT}@${PS_YELLOW}\h${PS_DEFAULT}:${PS_BLUE}\w${PS_DEFAULT}\$ "
fi



################################################################################
#
# Source extra configs
#

if [ -d ~/.bashrc.d ]; then
    for config_file in ~/.bashrc.d/bash.*; do
        [ -f ${config_file} ] && source ${config_file}
    done
fi

