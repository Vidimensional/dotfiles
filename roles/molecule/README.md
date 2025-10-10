# Molecule role

- [Molecule role](#molecule-role)
  - [Description](#description)
  - [Supported platforms](#supported-platforms)
  - [Variables](#variables)
  - [Requirements](#requirements)
  - [Files](#files)
  - [Packages installed](#packages-installed)

## Description

Installs [molecule](https://github.com/ansible/molecule). It is used to test this project.

## Supported platforms

- macOS
- Ubuntu

## Variables

| Name                   | Description                                                                         | Required | Default               |
| ---------------------- | ----------------------------------------------------------------------------------- | -------- | --------------------- |
| `pipx_executable_path` | `ansible-playbook` could be ran in a virtualenv, we want to access the system pipx. | No       | `/usr/local/bin/pipx` |

## Requirements

- macOS
  - pipx

- Ubuntu
  - pipx

## Files

N/A

## Packages installed

- pipx - [molecule](https://pypi.org/project/molecule/)
