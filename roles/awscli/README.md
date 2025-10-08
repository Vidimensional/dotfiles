# AWS CLI Role

- [AWS CLI Role](#aws-cli-role)
  - [Description](#description)
  - [Supported platforms](#supported-platforms)
  - [Variables](#variables)
  - [Requirements](#requirements)
  - [Files](#files)
  - [Packages installed](#packages-installed)

## Description

Installs [AWS CLI tool](https://aws.amazon.com/cli/).

Also installs [`awsprofile`](files/awsprofile.bash) tool to switch between aws profiles.

## Supported platforms

- macOS
- Ubuntu

## Variables

N/A

## Requirements

- macOS
  - Homebrew

- Ubuntu
  - Snap

## Files

- [`~/.bashrc.d/awsprofile.bash`](files/awsprofile.bash) utility used to switch between AWS profiles.

## Packages installed

- macOS
  - Homebrew - [awscli](https://formulae.brew.sh/formula/awscli)

- Ubuntu
  - Snap - [aws-cli](https://snapcraft.io/aws-cli)
