#!/bin/bash

set -euo pipefail

case "$( uname -o )" in
  Linux)
    sudo apt-get install pipx
    pipx install --include-deps ansible
    ;;
  Darwin)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install ansible
    ;;
esac

ansible-galaxy install -r requirements/main.yaml
