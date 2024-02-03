FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y openssh-server \
                       net-tools \
                       iputils-ping \
                       tcpdump \
                       curl \
                       sudo \
                       sshpass
RUN groupadd -g 1001 ansible
RUN useradd -m -s /bin/bash -u 1001 -g ansible -d /home/ansible ansible
RUN echo "ansible:ansible" | chpasswd
RUN usermod -aG sudo ansible

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
