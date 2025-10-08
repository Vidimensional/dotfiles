# Visual Studio Code module

Installs and configures [Visual Studio Code](https://code.visualstudio.com/) and its extensions.

The configuration can be found as is in a JSON file [`files/settings.json`](files/settings.json).

The list of extensions we want to install can be provided via the variable `vscode_extensions_list` in [`defaults/main.yaml`](defaults/main.yaml).

## Supported platforms

* macOS
* Ubuntu

## Variables

| Name                           | Description                           | Required | Default                                                                             |
|--------------------------------|---------------------------------------|----------|-------------------------------------------------------------------------------------|
| `vscode_binary_linux`          | Path of the `code` binary in Linux.   | No       | `/snap/bin/code`                                                                    |
| `vscode_binary_macos`          | Path of the `code` binary in macOS.   | No       | `/opt/homebrew/bin/code`                                                            |
| `vscode_extensions_list`       | List of extensions we want to install. | No       | List too long. See [`defaults/main.yaml`](defaults/main.yaml) for the complete list |
| `vscode_config_path_linux`     | Configuration path in Linux.          | No       | `{{ ansible_facts['user_dir'] }}/.config/Code/User`                                 |
| `vscode_config_path_macos`     | Configuration path in macOS.          | No       | `{{ ansible_facts['user_dir'] }}/Library/Application Support/Code/User`             |

## Requirements

* macOS
  * [Homebrew](../homebrew/README.md)

* Ubuntu
  * N/A

## Packages installed

* macOS
  * Homebrew Cask - [visual-studio-code](https://formulae.brew.sh/cask/visual-studio-code)

* Ubuntu
  * Snap - [code](https://snapcraft.io/code)
