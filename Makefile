.PHONY: init
init:
	sudo apt-get install python3-pip
	sudo python3 -m pip install ansible

.PHONY: laptop
laptop:
	ansible-playbook --ask-become-pass laptop.yml

.PHONY: ubuntu-wsl
ubuntu-wsl:
	ansible-playbook --ask-become-pass ubuntu-wsl.yml
