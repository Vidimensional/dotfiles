SCRIPT_VERSION=v1.0
SCRIPT_AUTHOR=Daniel Vidal de la Rubia

.PHONY: help
HELP_FUN = \
	%help; while(<>){push@{$$help{$$2//'options'}},[$$1,$$3]\
	if/^([\w-_]+)\s*:.*\#\#(?:@(\w+))?\s(.*)$$/};\
	print"$$_:\n", map"  $$_->[0]".(" "x(20-length($$_->[0])))."$$_->[1]\n",\
	@{$$help{$$_}},"\n" for keys %help;\

help: ## Show this help
	@echo "Usage: make [target] ...\n"
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)
	@echo "Written by $(SCRIPT_AUTHOR), version $(SCRIPT_VERSION)"


.PHONY: init
init: install-pipx install-ansible install-collections ## Calls the targets needed to apply the ansible playbook.


.PHONY: install-pipx
install-pipx: ## Installs pipx (needed to install Ansible and other dependencies) [called by `init`].
	/bin/bash scripts/install-pipx.sh

.PHONY: install-ansible
install-ansible: install-pipx ## Installs Ansible [called by `init`].
	pipx install --include-deps ansible

.PHONY: install-collections
install-collections: ## Installs collections needed to run the playbook [called by `init`].
	ansible-galaxy install -r collections/requirements.yml

.PHONY: install-lint
install-lint: ## Installs ansible-lint.
	ansible localhost --module-name include_role\
		--args name=ansible_lint\
		--extra-vars pipx_executable_path=`which pipx`

.PHONY: install-molecule
install-molecule: ## Install molecule.
	ansible localhost --module-name include_role\
		--args name=molecule\
		--extra-vars pipx_executable_path=`which pipx`

.PHONY: playbook
run: playbook ## Runs the playbook and configures localhost.
playbook:
	ansible-playbook \
		--ask-become-pass \
		--vault-password-file vault-pass.txt \
		playbook.yaml

.PHONY: lint
lint:  ## Runs ansible-lint.
	ansible-lint roles/* playbook.yaml

.PHONY: test
test:  ## Runs tests with molecule.
	@echo not implemented yet
