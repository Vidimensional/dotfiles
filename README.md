# vidimensional/dotfiles

- [vidimensional/dotfiles](#vidimensionaldotfiles)
  - [Description](#description)
  - [Supported environments](#supported-environments)
  - [Usage](#usage)
    - [Run it](#run-it)
    - [Test it](#test-it)
  - [License](#license)

## Description

Configures localhost Desktop with Ansible(you can call it an overcomplicated dotfiles repo 😜).

## Supported environments

This project is only been tested on:

- Ubuntu 24.04.03 'Noble Numbat'
- macOS 15.4.1 'Sequoia'

## Usage

All can be done via Makefile:

```text
$ make help
Usage: make [target] ...

options:
  help                Show this help
  init                Calls the targets needed to apply the ansible playbook.
  install-pipx        Installs pipx (needed to install Ansible and other dependencies) [called by `init`].
  install-ansible     Installs Ansible [called by `init`].
  install-collections Installs collections needed to run the playbook [called by `init`].
  install-lint        Installs ansible-lint.
  install-molecule    Install molecule.
  run                 Runs the playbook and configures localhost.
  lint                Runs ansible-lint.
  test                Runs tests with molecule.

Written by Daniel Vidal de la Rubia, version v1.0
```

### Run it

To install Ansible and its dependencies:

```text
make init
```

To apply the configurations on your Desktop.

```text
make run
```

### Test it

To install testing dependencies:

```text
make install-lint
make install-molecule
```

To run linter:

```text
make lint
```

To run tests

```text
make test
```

## License

This project is licensed under the [Do What The Fuck You Want To Public License](LICENSE)(WTFPL).

So do what the fuck you want with this.
