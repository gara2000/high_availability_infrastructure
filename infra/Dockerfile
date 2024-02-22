FROM ubuntu:24.04

RUN apt update && apt install -y sudo
RUN apt update && apt install -y software-properties-common

# Installing necessary ssh tools
RUN apt update && apt install -y openssh-server
RUN apt update && apt install -y sshpass

# Installing necessary networking tools
RUN apt update && apt install -y net-tools
RUN apt update && apt install -y iputils-ping
RUN apt update && apt install -y tcpdump
RUN apt update && apt install -y curl
RUN apt update && apt install -y iproute2

# Installing vim text editor
RUN apt update && apt install -y vim

# Installing Ansible
RUN apt-add-repository -r ppa:ansible/ansible
RUN apt update && apt install -y ansible

# Creating the ansible user
RUN groupadd -g 1001 ansible
RUN useradd -m -s /bin/bash -u 1001 -g ansible -d /home/ansible ansible
RUN echo "ansible:ansible" | chpasswd
RUN usermod -aG sudo ansible

# Copying necessary scripts to be executed in the container
COPY entry_point.sh /usr/local/bin/entry_point.sh
COPY ansible_set_up.sh /usr/local/bin/ansible_set_up.sh
RUN chown ansible /usr/local/bin/entry_point.sh
RUN chown ansible /usr/local/bin/ansible_set_up.sh

WORKDIR /home/ansible
RUN echo "ansible" > pass_file

USER ansible

RUN chmod +x /usr/local/bin/entry_point.sh
RUN chmod +x /usr/local/bin/ansible_set_up.sh

ENTRYPOINT ["/usr/local/bin/entry_point.sh"]
