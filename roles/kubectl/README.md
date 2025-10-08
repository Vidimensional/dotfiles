# Kubectl role

- [Kubectl role](#kubectl-role)
  - [Description](#description)
  - [Supported platforms](#supported-platforms)
  - [Variables](#variables)
  - [Requirements](#requirements)
  - [Files](#files)
  - [Packages installed](#packages-installed)

## Description

Installs [kubectl](https://kubernetes.io/docs/reference/kubectl/) and [kubectx](https://github.com/ahmetb/kubectx/).

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

- [`~/bashrc.d/kubectl.bash`](files/kubectl.bash) Shell aliases for working with Kubernetes.

## Packages installed

- macOS
  - Homebrew - [kubectl](https://formulae.brew.sh/formula/kubernetes-cli)
  - Homebrew - [kubectx](https://formulae.brew.sh/formula/kubectx)

- Ubuntu
  - Snap - [kubectl](https://snapcraft.io/kubectl)
  - APT - kubectx
