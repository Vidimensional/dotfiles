# Docker role

- [Docker role](#docker-role)
  - [Description](#description)
  - [Supported platforms](#supported-platforms)
  - [Variables](#variables)
  - [Requirements](#requirements)
  - [Files](#files)
  - [Packages installed](#packages-installed)

## Description

Installs the [Go Program Language](https://go.dev/) tools.

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

- [`~/.bashrc.d/go.bash`](files/go.bash) Configures `$GOPATH`.

## Packages installed

- macOS
  - Homebrew - [go](https://formulae.brew.sh/formula/go)

- Ubuntu
  - Snap - [go](https://snapcraft.io/go)
