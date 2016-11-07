################################################################################
# Source extra configs
if [ -d ~/.bashrc.d ]; then
    for config_file in ~/.bashrc.d/bash.*; do
        [ -f ${config_file} ] && source ${config_file}
    done
fi

################################################################################
# Load bash-completion configuration
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

if [ -d /usr/local/etc/bash_completion.d ]; then
    for file in $( find /usr/local/etc/bash_completion.d/ ! -type d); do
        source ${file}
    done
fi

################################################################################
# Define prompt
[ ${UID} -eq 0 ] && PS_USER="\[${__RED}\]\u" || PS_USER="\[${__GREEN}\]\u"
PS_HOSTNAME="\[${__YELLOW}\]\h"
PS_PATH="\[${__BLUE}\]\w"
PROMPT_COMMAND='__git_ps1 "${PS_USER}\[${__DEFAULT}\]@${PS_HOSTNAME}\[${__DEFAULT}\]:${PS_PATH}\[${__PURPLE}\]" "\[${__DEFAULT}\]\\\$ "'

