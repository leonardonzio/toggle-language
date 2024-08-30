#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "You have to run the script with privileges !"; exit 1 
fi

lang=$(head /etc/vconsole.conf | grep "KEYMAP=" | cut -d "=" -f2)

if [ $lang = it ]; then
	new_lang=us
else
	new_lang=it
fi


sed -i "s/^KEYMAP=.*/KEYMAP=$new_lang/" /etc/vconsole.conf
systemctl restart systemd-vconsole-setup.service

echo "new language set to '$new_lang'"

