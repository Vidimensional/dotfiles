.PHONY: init
init:
	sudo apt-get install python3-pip
	python3 -m pip install ansible

.PHONY: apply
apply:
	ansible-playbook --ask-become-pass playbook.yml
