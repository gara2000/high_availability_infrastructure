##This script sets up the ssh configuration between the infra servers and the other servers
#!/bin/bash


servers=$(docker ps --format "table {{.Names}}" | grep -v infra | grep -iv names)

echo $servers

docker exec ha_infra_1 /usr/local/bin/ansible_set_up.sh "$servers"
docker exec ha_infra_2 /usr/local/bin/ansible_set_up.sh "$servers"
#docker exec infra /usr/local/bin/ansible_set_up.sh "$servers"
