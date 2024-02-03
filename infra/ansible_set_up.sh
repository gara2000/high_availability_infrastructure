#!/bin/bash
servers=$1 
sudo su - ansible
ssh-keygen -t ed25519 -N "" -f ~/.ssh/id_ed25591

for server in  $servers; do
  sshpass -f pass_file ssh-copy-id -o "StrictHostKeyChecking no" ansible@$server
done
