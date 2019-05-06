#!/bin/bash

ansible-playbook -i "localhost," create/01-create-monipi.yml

if [ ! -d /opt/omd/sites/default ]; then 
omd create default
omd start default
fi

