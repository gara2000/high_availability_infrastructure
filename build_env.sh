#!/bin/bash

ready() {
  while true; do
    ping -c 1 $1 &> /dev/null
    result=$?
    if [ $result = 0 ]; then
      echo "Ready!"
      break
    else
      echo "Not Ready Yet..." 
    fi
  done
}

# Launch VMs
VBoxManage startvm "Node1" --type headless
VBoxManage startvm "Node2" --type headless
VBoxManage startvm "Infra" --type headless

# Cheking connectivity
echo "Checking connectivitiy"
infra=192.168.56.2
node1=192.168.56.3
node2=192.168.56.4
ready $infra
ready $node1
ready $node2

# Create a new tmux session
tmux new-session -d -s ha_project

# Create the first window 
tmux rename-window -t ha_project:0 "Main"

# Create additional windows 
tmux new-window -t ha_project: -n "Infra"
tmux new-window -t ha_project: -n "Node1"
tmux new-window -t ha_project: -n "Node2"
tmux new-window -t ha_project: -n "Docs"


tmux send-keys -t ha_project:"Infra" "ssh ubuntu@192.168.56.2"
tmux send-keys -t ha_project:"Node1" "ssh ubuntu@192.168.56.3"
tmux send-keys -t ha_project:"Node2" "ssh ubuntu@192.168.56.4"
tmux send-keys -t ha_project:"Docs" "cd ~/docs" Enter

sleep 1

# Attach to the tmux session
tmux attach-session -t ha_project
