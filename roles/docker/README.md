# Docker role

- [Docker role](#docker-role)
  - [Description](#description)
  - [Supported platforms](#supported-platforms)
  - [Variables](#variables)
  - [Requirements](#requirements)
  - [Files](#files)
  - [Packages installed](#packages-installed)

## Description

Installs [Docker](https://www.docker.com/).

In Ubuntu also adds user to docker group to work without `root`.

In macOS installs `qemu` and `colima` in order to run without requiring Docker Desktop.

## Supported platforms

- macOS
- Ubuntu

## Variables

N/A

## Requirements

- macOS
  - [Homebrew](../homebrew/README.md)

- Ubuntu
  - N/A
  
## Files

- [`~/bashrc.d/docker.bash`](files/docker.bash) Shell aliases for working with Docker.

## Packages installed

- macOS
  - Homebrew - [qemu](https://formulae.brew.sh/formula/qemu)
  - Homebrew - [colima](https://formulae.brew.sh/formula/colima)
  - Homebrew - [docker](https://formulae.brew.sh/formula/docker)
  - Homebrew - [docker-completion](https://formulae.brew.sh/formula/docker-completion)

- Ubuntu
  - Snap - [docker](https://snapcraft.io/docker)
