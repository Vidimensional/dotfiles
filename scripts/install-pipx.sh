#!/bin/bash

# Installs the dependencies needed to run Ansible

set -euo pipefail

case "$( uname -s )" in
  Linux)
    sudo apt-get update
    sudo apt-get install --assume-yes python3-pip
    sudo pip install --break-system-packages pipx # We need at least version 1.7.0 (this should be fixed when upgrading to Ubuntu 25.04)
    ;;
  Darwin)
    /bin/bash -c "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh )"
    brew install pipx
    ;;
esac
