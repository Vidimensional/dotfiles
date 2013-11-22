
################################################################################
#
# Define prompt
#
PS_GREEN="\[\033[01;32m\]"
PS_BLUE="\[\033[01;34m\]"
PS_DEFAULT="\[\033[00m\]"
PS1="${PS_GREEN}\u${PS_DEFAULT}@${PS_GREEN}\h${PS_DEFAULT}:${PS_BLUE}\w${PS_DEFAULT}\$ "


################################################################################
#
# Source extra configs
#

if [ -d ~/.bashrc.d ]; then
    for config_file in ~/.bashrc.d/*; do
        [ -f ${config_file} ] && source ${config_file}
    done
fi

