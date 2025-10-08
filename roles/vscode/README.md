# Visual Studio Code module

Installs and configures [Visual Studio Code](https://code.visualstudio.com/).

The configuration can be found as is in a JSON file [`files/settings.json`](files/settings.json).

## Supported platforms

* macOS
* Ubuntu

## Variables

| Name                       | Description                        | Required | Default                                                                 |
|----------------------------|------------------------------------|----------|-------------------------------------------------------------------------|
| `vscode_linux_config_path` | Configuration path in Linux.       | No       | `{{ ansible_facts['user_dir'] }}/.config/Code/User`                     |
| `vscode_macos_config_path` | Configuration path in macOS.       | No       | `{{ ansible_facts['user_dir'] }}/Library/Application Support/Code/User` |

## Requirements

* macOS
  * [Hombrew](../homebrew/README.md)

* Ubuntu
  * N/A

## Packages installed

* macOS
  * Homebrew Cask - [visual-studio-code](https://formulae.brew.sh/cask/visual-studio-code)

* Ubuntu
  * Snap - [code](https://snapcraft.io/code)
