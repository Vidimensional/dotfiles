#!/bin/bash

source bashrc.d/bash.colors


log () {
    echo -ne "${__YELLOW}"
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $@"
    echo -ne "${__DEFAULT}"
}

_rsync () {
    rsync --recursive --verbose --checksum --exclude '.*.swp' $@
}


install_bashconfig () {
    log "Installing bashrc."
    cp -a bashrc ~/.bashrc
    _rsync bashrc.d/* ~/.bashrc.d
    log "Downloading & installing git-prompt"
    git_prompt_url='https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh'
    curl -s "${git_prompt_url}" -o ~/.bashrc.d/bash.git-prompt
    log "Downloading & installing bash completion for Hub."
    hub_autocompletion_url='https://raw.githubusercontent.com/github/hub/master/etc/hub.bash_completion.sh'
    curl -s "${hub_autocompletion_url}" -o  ~/.bashrc.d/bash.hub.bash_completion.sh
    reloadbash #Alias that resources the .bashrc.
    log "Done."
}


install_vimconfig () {
    log "Installing vimrc."
    cp vimrc ~/.vimrc
    _rsync vimrc.d/* ~/.vimrc.d
    log "Installing Vim plugins via Plug."
    vim +PlugInstall +qall
    log "Done."
}


install_iterm2config () {
    log "Installing iTerm2."
    _rsync iterm2/* ~/.iterm2/
    log "Done."
}


if which md5sum; then
	md5sum='md5sum'
elif which md5; then
	md5sum='md5'
fi

old_installer_md5="$( ${md5sum} $0 )"
log "Getting the last version."
git pull origin master
new_installer_md5="$( ${md5sum} $0 )"
if [ "${old_installer_md5}" != "${new_installer_md5}" ]; then
	log "The installler has been updated, calling it again"
	$0 $#
	exit
fi

install_bashconfig
install_vimconfig
install_iterm2config

