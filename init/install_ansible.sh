#!/bin/bash

# Installs the dependencies needed to run Ansible

set -euo pipefail

case "$( uname -s )" in
  Linux)
    sudo apt-get update
    sudo apt-get install --assume-yes pipx
    pipx install --include-deps ansible
    ;;
  Darwin)
    /bin/bash -c "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh )"
    brew install ansible
    ;;
esac

ansible-galaxy install -r collections/requirements.yml
