.PHONY: init
init:
	sudo apt-get install python3-pip
	python3 -m pip install ansible

.PHONY: run
run:
	ansible-playbook --ask-become-pass playbook.yml
