#!/bin/bash

set -eu

INSTALLATION_PATH="/opt/Hashicorp/Terraform"
TERRAFORM_RELEASES_URL="https://releases.hashicorp.com/terraform"
GITHUB_RELEASES_URL="https://api.github.com/repos/hashicorp/terraform/releases"

echo "-> Getting latest release number."
release="$( curl -s ${GITHUB_RELEASES_URL} | jq '.[].tag_name' | grep -Ev '(beta|rc)' | head -n1 | grep -Eo '[0-9.]+' )"
echo "-> Latest release is ${release}."

TMP_PATH="/tmp/terraform_${release}_linux_amd64"

if [ -e "${INSTALLATION_PATH}/${release}" ]; then
    echo "Version already installed."
    exit
fi

echo "-> Downloading Terraform ${release}."

wget -O"${TMP_PATH}.zip" "${TERRAFORM_RELEASES_URL}/${release}/terraform_${release}_linux_amd64.zip"
trap 'rm -vrf "${TMP_PATH}"*' EXIT INT TERM #Clean ${TMP_PATH}.zip at exit.

echo "-> Checking SHA256 sum."
original_sha256sum="$( curl -s "${TERRAFORM_RELEASES_URL}/${release}/terraform_${release}_SHA256SUMS" | awk '/linux_amd64/ {print $1}' )"
local_sha256sum="$( sha256sum "${TMP_PATH}.zip" | awk '{print $1}' )"
if [ "${original_sha256sum}" != "${local_sha256sum}" ]; then
    echo "SHA256SUM FAIL"
    exit 1
fi

echo "-> Copying binaries to ${INSTALLATION_PATH}."
unzip "${TMP_PATH}.zip" -d "${TMP_PATH}/"
mv "${TMP_PATH}/terraform" "${INSTALLATION_PATH}/${release}"
rm -fv "${INSTALLATION_PATH}/terraform"
ln -s "${INSTALLATION_PATH}/${release}" "${INSTALLATION_PATH}/terraform"
