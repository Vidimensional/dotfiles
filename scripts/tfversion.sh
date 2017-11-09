#!/bin/bash

set -eu

INSTALLATION_PATH="/opt/Hashicorp/Terraform"

get_installed_versions() {
    find "${INSTALLATION_PATH}" -type f | xargs -I{} -- basename {}
}

get_current_version() {
    readlink "${INSTALLATION_PATH}/terraform" | xargs -I{} -- basename {}
}

set_current_version() {
    rm -v "${INSTALLATION_PATH}/terraform"
    ln -s "${INSTALLATION_PATH}/$1" "${INSTALLATION_PATH}/terraform"
}


case $1 in
    list)
        current_version="$(get_current_version)"
        get_installed_versions | grep --color -E "(^|^${current_version}$)"
        ;;
    set-version|set)
        if [ -z "$2" ]; then
            echo "Show usage"
            exit 1
        fi

        if get_installed_versions | grep -Eq "^$2\$"; then
            set_current_version $2
        else
            echo "Version $2 not installed."
            exit 2
        fi
        ;;
esac
