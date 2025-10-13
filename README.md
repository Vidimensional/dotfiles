# vidimensional/dotfiles

- [vidimensional/dotfiles](#vidimensionaldotfiles)
  - [Description](#description)
  - [Supported environments](#supported-environments)
  - [Usage](#usage)
    - [Run it](#run-it)
    - [Test it](#test-it)
  - [License](#license)

## Description

Configures localhost Desktop with Ansible (you can call it an overcomplicated dotfiles repo 😜).

## Supported environments

This project has only been tested on:

- Ubuntu 24.04.3 'Noble Numbat'
- macOS 15.4.1 'Sequoia'

## Usage

All can be done via Makefile:

```text
$ make help
Usage: make [target] ...

options:
  help                Show this help
  install-dep         Install dependencies needed to run the playbook.
  install-test-tools  Install testing tools (ansible-lint & molecule) basically for CI pipeline.
  run                 Runs the playbook and configures localhost.
  lint                Runs ansible-lint.
  test                Runs tests with molecule.

Written by Daniel Vidal de la Rubia, version v1.0
```

### Run it

To install Ansible and its dependencies:

```text
make install-dep
```

To apply the configurations on your Desktop.

```text
make run
```

### Test it

To install testing dependencies:

```text
make install-test-tools
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

This project is licensed under the [Do What The Fuck You Want To Public License](LICENSE) (WTFPL).

So do what the fuck you want with this.
