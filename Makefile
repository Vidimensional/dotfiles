.PHONY: init
init:
	sudo apt-get install python3-pip
	sudo python3 -m pip install --break-system-packages ansible
	ansible-galaxy install -r requirements/main.yaml

.PHONY: ubuntu
ubuntu:
	ansible-playbook \
		--ask-become-pass \
		--vault-password-file vault-pass.txt \
		ubuntu.yaml

.PHONY: macos
macos:
	ansible-playbook \
		--ask-become-pass \
		--vault-password-file vault-pass.txt \
		macos.yaml


.PHONY: facts
facts:
	ansible-playbook \
		--ask-become-pass \
		--vault-password-file vault-pass.txt \
		ansiblefacts.yaml
