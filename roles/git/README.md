# Git Role

- [Git Role](#git-role)
  - [Description](#description)
  - [Supported platforms](#supported-platforms)
  - [Variables](#variables)
  - [Requirements](#requirements)
  - [Files](#files)
  - [Packages installed](#packages-installed)
  - [Role dependency](#role-dependency)

## Description

Installs [git](https://git-scm.com/) & [tig](https://jonas.github.io/tig/) tools.

Also configures Git.

## Supported platforms

- macOS
- Ubuntu

## Variables

N/A

## Requirements

- macOS
  - Homebrew

- Ubuntu
  - apt

## Files

- [`~/.bashrc.d/git.bash`](files/git.bash) Adds some shell aliases and functions for working with Git.
- [`~/.gitconfig`](files/gitconfig) Git global configuration.
- [`~/.gitconfig.d/gitignore`](files/gitconfig.d/gitignore) Global gitignore config.

## Packages installed

- macOS
  - Homebrew - [git](https://formulae.brew.sh/formula/git)
  - Homebrew - [tig](https://formulae.brew.sh/formula/tig)

- Ubuntu
  - apt - git
  - apt - tig

## Role dependency

- [bash](../bash/README.md)
