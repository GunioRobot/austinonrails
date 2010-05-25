#!/bin/bash

# create a public key (if you don't already have one)
mkdir -p ~/.ssh
chmod 700 ~/.ssh
if [ ! -f ~/.ssh/id_rsa.pub ]; then
	ssh-keygen -q -f ~/.ssh/id_rsa -t rsa
fi
chmod go-rwx ~/.ssh/*

# copy the public key over the app user
scp ~/.ssh/id_rsa.pub austinonrails@twelvelabs.com:~
ssh austinonrails@twelvelabs.com
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cat ~/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
rm ~/id_rsa.pub
logout
