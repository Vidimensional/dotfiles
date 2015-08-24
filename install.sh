#!/bin/bash

log () {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $@"
}


install_bashconfig () {
    log "Installing .bashrc"
    rsync -rvc .bashrc* ~/

    log "Downloading & installing git-prompt"
    git_prompt_url='https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh'
    curl -s "${git_prompt_url}" -o ~/.bashrc.d/bash.git-prompt
}

install_vimconfig () {
    log "Installing .vimrc"
    rsync -rvc .vim* ~/
}

case $1 in
    'bash')
        install_bashconfig
        ;;

    'vim')
        install_vimconfig
	;;

    'all')
        install_bashconfig
        install_vimconfig
	;;

    *)
        echo "USAGE $0 <bash|vim>"
        ;;
esac

