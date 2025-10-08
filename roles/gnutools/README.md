# GNU Tools role

- [GNU Tools role](#gnu-tools-role)
  - [Description](#description)
  - [Supported platforms](#supported-platforms)
  - [Variables](#variables)
  - [Requirements](#requirements)
  - [Files](#files)
  - [Packages installed](#packages-installed)

## Description

Installs GNU implementation for Posix tools in macOS.

- [coreutils](https://www.gnu.org/software/coreutils/)
- [gawk](https://www.gnu.org/software/gawk/)
- [gnu-tar](https://www.gnu.org/software/tar/)
- [gnu-sed](https://www.gnu.org/software/sed/)

## Supported platforms

- macOS
- Ubuntu (it does nothing, but doesn't crash either).

## Variables

N/A

## Requirements

- macOS
  - [Homebrew](../homebrew/README.md)

- Ubuntu
  - N/A

## Files

- [`~/.bashrc.d/gnutools.bash`](files/gnutools.bash) Configure `$PATH` to find the GNU tools binaries.

## Packages installed

- macOS
  - Homebrew - [coreutils](https://formulae.brew.sh/formula/coreutils)
  - Homebrew - [gawk](https://formulae.brew.sh/formula/gawk)
  - Homebrew - [gnu-tar](https://formulae.brew.sh/formula/gnu-tar)
  - Homebrew - [gnu-sed](https://formulae.brew.sh/formula/gnu-sed)

- Ubuntu
  - N/A
