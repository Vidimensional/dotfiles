#!/bin/bash

source bash/bashrc.d/colors.bash


log () {
    echo -e "> ${__YELLOW}$@${__DEFAULT}"
}

_rsync () {
    rsync --recursive --verbose --checksum --exclude '.*.swp' $@
}


install_docker_images() {
    local images='vidimensional/slack_cli
                  vidimensional/describe_ec2_instances
                  vidimensional/psql
                  vidimensional/mysql-client
                  vidimensional/jq
                  vidimensional/ansible
                  mesosphere/aws-cli'
    for image in $images; do
        log "Downloading ${image} Docker image."
        docker pull "${image}"
    done
}


install_bashconfig () {
    log "Installing bashrc."
    cp -v bash/bashrc ~/.bashrc
    if [[ "$(uname -s)" == Darwin ]]; then
        if ! [[ -L ~/.bash_profile ]] || ! [[ "$(readlink ~/.bash_profile)" == ~/.bashrc ]]; then
            rm ~/.bash_profile
            ln -s  ~/.bashrc ~/.bash_profile
        fi
    fi

    _rsync bash/bashrc.d/* ~/.bashrc.d
    log "Downloading & installing git-prompt"
    git_prompt_url='https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh'
    curl -s "${git_prompt_url}" -o ~/.bashrc.d/git-prompt.bash
    log "Downloading & installing bash completion for Hub."
    hub_autocompletion_url='https://raw.githubusercontent.com/github/hub/master/etc/hub.bash_completion.sh'
    curl -s "${hub_autocompletion_url}" -o  ~/.bashrc.d/hub.bash_completion.bash
    source ~/.bashrc
}


install_vimconfig () {
    log "Installing vimrc."
    cp -v vim/vimrc ~/.vimrc
    _rsync vim/vimrc.d/* ~/.vimrc.d
    log "Installing Vim plugins via Plug."
    vim +PlugInstall +qall
}

install_gitconfig () {
    log "Installing gitconfig."
    cp -v git/gitconfig ~/.gitconfig
    cp -v git/gitignore_global ~/.gitignore_global
    _rsync git/gitconfig.d/* ~/.gitconfig.d
}


install_iterm2config () {
    log "Installing iTerm2."
    _rsync iterm2/* ~/.iterm2/
}

install_scripts () {
    log "Installing scripts."
    local scripts_dir='/opt/scripts'
    sudo mkdir -p "${scripts_dir}"
    sudo chown "$(whoami)" "${scripts_dir}"
    _rsync scripts/* "${scripts_dir}"
}

log "Checking sudo."
sudo echo "Ok."
if which md5sum >/dev/null; then
    md5sum='md5sum'
elif which md5 >/dev/null; then
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

#install_docker_images
install_bashconfig
install_gitconfig
#install_vimconfig
install_iterm2config
install_scripts

