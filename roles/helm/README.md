# Helm role

- [Helm role](#helm-role)
  - [Description](#description)
  - [Supported platforms](#supported-platforms)
  - [Variables](#variables)
  - [Requirements](#requirements)
  - [Files](#files)
  - [Packages installed](#packages-installed)

## Description

Installs [Helm](https://helm.sh/).

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

- [`~/bashrc.d/helm.bash`](files/helm.bash) Shell aliases for working with Helm.

## Packages installed

- macOS
  - Homebrew - [helm](https://formulae.brew.sh/formula/helm)

- Ubuntu
  - Snap - [helm](https://snapcraft.io/helm)
