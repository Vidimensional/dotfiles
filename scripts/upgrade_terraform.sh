#!/bin/bash

set -e

INSTALLATION_PATH="/opt/Hashicorp/Terraform"
TERRAFORM_RELEASES_URL="https://releases.hashicorp.com/terraform"
GITHUB_RELEASES_URL="https://api.github.com/repos/hashicorp/terraform/releases"

echo "-> Getting latest release number."
release="$( curl -s ${GITHUB_RELEASES_URL} | jq '.[].tag_name' | head -n1 | grep -Eo '[0-9.]+' )"
echo "-> Latest release is ${release}."

if [ -e "${INSTALLATION_PATH}/${release}" ]; then
    echo "Version already installed."
    exit
fi

echo "-> Downloading Terraform ${release}."
TMP_DOWNLOAD_PATH="/tmp/terraform_${release}_linux_amd64.zip"
wget -O"${TMP_DOWNLOAD_PATH}" "${TERRAFORM_RELEASES_URL}/${release}/terraform_${release}_linux_amd64.zip"
trap 'rm -vf "${TMP_DOWNLOAD_PATH}"' EXIT INT TERM #Clean ${TMP_DOWNLOAD_PATH} at exit.

echo "-> Checking SHA256 sum."
original_sha256sum="$( curl -s "${TERRAFORM_RELEASES_URL}/${release}/terraform_${release}_SHA256SUMS" | awk '/linux_amd64/ {print $1}' )"
local_sha256sum="$( sha256sum "${TMP_DOWNLOAD_PATH}" | awk '{print $1}' )"
if [ "${original_sha256sum}" != "${local_sha256sum}" ]; then
    echo "SHA256SUM FAIL"
    exit 1
fi

echo "-> Copying binaries to ${INSTALLATION_PATH}."
mkdir -p "${INSTALLATION_PATH}/${release}"
unzip "${TMP_DOWNLOAD_PATH}" -d "${INSTALLATION_PATH}/${release}"
rm -fv "${INSTALLATION_PATH}/current"
rm -rfv /usr/local/bin/terraform
ln -s "${INSTALLATION_PATH}/${release}/terraform" /usr/local/bin/terraform
