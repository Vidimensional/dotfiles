.PHONY: init
init:
	sudo apt-get install python3-pip
	sudo python3 -m pip install ansible

.PHONY: apply
apply:
	ansible-playbook --ask-become-pass playbook.yml
