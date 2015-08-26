#!/bin/bash

log () {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $@"
}


install_bashconfig () {
    log "Installing bashrc."
    rsync -rvc .bashrc* ~/

    log "Downloading & installing git-prompt"
    git_prompt_url='https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh'
    curl -s "${git_prompt_url}" -o ~/.bashrc.d/bash.git-prompt
}

install_vimconfig () {
    log "Installing vimrc."
    rsync -rvc .vim* ~/
    log "Installing Vim plugins via Vundle."
    vim +PluginInstall +qall
}

install_i3config () {
    log "Installing i3 config."
    rsync -rvc .i3 ~/
}

case $1 in
    'bash')
        install_bashconfig
        ;;

    'vim')
        install_vimconfig
	;;

    'i3')
        install_i3config
	;;

    'all')
        install_bashconfig
        install_vimconfig
        install_i3config
	;;

    *)
        echo "USAGE $0 <bash|vim|i3>"
        ;;
esac

