# Ansible-lint role

- [Ansible-lint role](#ansible-lint-role)
  - [Description](#description)
  - [Supported platforms](#supported-platforms)
  - [Variables](#variables)
  - [Requirements](#requirements)
  - [Files](#files)
  - [Packages installed](#packages-installed)

## Description

Installs [ansible-lint](https://github.com/ansible/ansible-lint). It is used to test this project.

## Supported platforms

- macOS
- Ubuntu

## Variables

| Name                   | Description                                                                         | Required | Default               |
| ---------------------- | ----------------------------------------------------------------------------------- | -------- | --------------------- |
| `pipx_executable_path` | `ansible-playbook` could be run in a virtualenv, we want to access the system pipx. | No       | `/usr/local/bin/pipx` |

## Requirements

- macOS
  - pipx

- Ubuntu
  - pipx

## Files

N/A

## Packages installed

- pipx - [ansible-lint](https://pypi.org/project/ansible-lint/)
