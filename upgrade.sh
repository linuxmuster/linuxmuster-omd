#!/bin/bash

# get debian version
stage1=$(cat /etc/debian_version  | grep ^8)
stage2=$(cat /etc/debian_version  | grep ^9)

# stage1
if [ x$stage2 == "x" ]; then 
	echo "Playing ansible playbook for stage 1"
	ansible-playbook -i 'localhost,' ./upgrade/01-system.yml
fi

# stage2
if [ x$stage1 == "x" ]; then 
	echo "Playing ansible playbook for stage 2"
	ansible-playbook -i 'localhost,' ./upgrade/02-omd.yml
fi


