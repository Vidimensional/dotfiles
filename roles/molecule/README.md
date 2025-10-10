# Ansible Molecule role

- [Ansible Molecule role](#ansible-molecule-role)
  - [Description](#description)
  - [Supported platforms](#supported-platforms)
  - [Variables](#variables)
  - [Requirements](#requirements)
  - [Files](#files)
  - [Packages installed](#packages-installed)

## Description

Installs Ansible Molecule testing framework. This will be used to test this project.

## Supported platforms

- macOS
- Ubuntu

## Variables

N/A

## Requirements

- macOS
  - pipx (installed in `init/install_ansible.sh` script)

- Ubuntu
  - pipx

## Files

N/A

## Packages installed

- pipx - [molecule](https://pypi.org/project/molecule/)
