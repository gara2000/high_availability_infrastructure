VBoxManage controlvm "Infra" poweroff 2> /dev/null
VBoxManage controlvm "Node1" poweroff 2> /dev/null
VBoxManage controlvm "Node2" poweroff 2> /dev/null

tmux kill-session -t ha_project 2> /dev/null
