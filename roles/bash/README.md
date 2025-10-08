# Bash role

- [Bash role](#bash-role)
  - [Description](#description)
  - [Supported platforms](#supported-platforms)
  - [Variables](#variables)
  - [Requirements](#requirements)
  - [Files](#files)
  - [Packages installed](#packages-installed)

## Description

Configures bashrc-fu.

In macOS installs latest Bash version and configures it as a default shell.

## Supported platforms

- macOS
- Ubuntu

## Variables

| Name              | Description                                    | Required | Default                  |
| ----------------- | ---------------------------------------------- | -------- | ------------------------ |
| `bash_path_macos` | Path of the newly installed Bash (macOS only). | No       | `/opt/homebrew/bin/bash` |

## Requirements

- macOS
  - [Homebrew](../homebrew/README.md)

- Ubuntu
  - N/A

## Files

- [`~/.bashrc`](files/bashrc) Bash configuration.
- [`~/.bashrc.d/aliases_prompt.bash`](files/bashrc.d/aliases_prompt.bash) Bash aliases and functions used on shell prompt (git branch, kubectx, virtualenv, etc.).
- [`~/.bashrc.d/aliases.bash`](files/bashrc.d/aliases.bash) Basic aliases (verbose and colorful `ls` and `grep`, `ls` shorthands, etc.).
- [`~/.bashrc.d/colors.bash`](files/bashrc.d/colors.bash) Aliases for ANSI color scape sequences.
- [`~/.bashrc.d/path.bash`](files/bashrc.d/path.bash) Define special lookup paths for local binaries or specific tools like Homebrew.
- [`~/.bashrc.d/variables.bash`](files/bashrc.d/variables.bash) General environment variables for shell config.

## Packages installed

- macOS
  - Homebrew - [bash](https://formulae.brew.sh/formula/bash)
  - Homebrew - [bash-completion](https://formulae.brew.sh/formula/bash-completion)

- Ubuntu
  - N/A
