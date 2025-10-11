#!/bin/bash

# Installs the dependencies needed to run Ansible

set -euo pipefail

log_and_exec(){
  __PURPLE="\033[01;35m"
  __BWHITE="\033[01;37m"
  __DEFAULT="\033[00m"

  echo -e "${__BWHITE}>>> ${__PURPLE}$@${__DEFAULT}"
  $@
  echo # leave some space to breathe
}


case "$( uname -s )" in
  Linux)
    log_and_exec sudo apt-get update
    log_and_exec sudo apt-get install --assume-yes python3-pip python3-venv
    log_and_exec sudo pip install --break-system-packages pipx # We need at least version 1.7.0 (this should be fixed when upgrading to Ubuntu 25.04)
    ;;
  Darwin)
    log_and_exec /bin/bash -c "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh )"
    log_and_exec brew install pipx virtualenv
    ;;
esac

log_and_exec pipx ensurepath
# Make sure we got $PIPX_BIN_DIR on our $PATH (and, for some reason, sourcing ~/.bashrc wasn't working)
export PATH="${PATH}:$( pipx environment --value PIPX_BIN_DIR )"
log_and_exec pipx install --include-deps ansible
log_and_exec ansible-galaxy install -r collections/requirements.yml
