.PHONY: init
init:
	sudo apt-get install python3-pip
	sudo python3 -m pip install ansible
	ansible-galaxy install -r requirements/main.yml

.PHONY: laptop
laptop:
	ansible-playbook \
		--ask-become-pass \
		--vault-password-file vault-pass.txt \
		laptop.yml

.PHONY: ubuntu-wsl wsl
wsl: ubuntu-wsl
ubuntu-wsl:
	ansible-playbook \
		--ask-become-pass \
		--vault-password-file vault-pass.txt \
		ubuntu-wsl.yml
