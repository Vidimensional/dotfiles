#!/bin/bash

# Installs the dependencies needed to run Ansible

set -euo pipefail

case "$( uname -s )" in
  Linux)
    sudo apt-get update
    sudo apt-get install --assume-yes python3-pip python3-venv
    sudo pip install --break-system-packages pipx # We need at least version 1.7.0 (this should be fixed when upgrading to Ubuntu 25.04)
    ;;
  Darwin)
    /bin/bash -c "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh )"
    brew install pipx virtualenv
    ;;
esac

pipx ensurepath
# Make sure we got $PIPX_BIN_DIR on our $PATH (and, for some reason, sourcing ~/.bashrc wasn't working)
export PATH="${PATH}:$( pipx environment --value PIPX_BIN_DIR )"
pipx install --include-deps ansible
ansible-galaxy install -r collections/requirements.yml
