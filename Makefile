.PHONY: init
init:
	/bin/bash init.sh

.PHONY: playbook run
run: playbook
playbook:
	ansible-playbook \
		--ask-become-pass \
		--vault-password-file vault-pass.txt \
		playbook.yaml
