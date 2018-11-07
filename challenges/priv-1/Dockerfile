FROM ubuntu:16.04

# Base Docker for unpriviledge SSH
RUN mkdir /home/challenge/
RUN useradd -d /home/challenge/ -s /bin/bash challenge
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Target victim of the challenge
RUN useradd admin
RUN apt-get update
RUN apt-get install -y sudo vim openssl

# Faulty permission
RUN echo "challenge ALL=(admin) NOPASSWD: /usr/bin/openssl" >> /etc/sudoers
RUN mkdir /home/admin/
RUN echo "FLAG-ede3070e08a9d904509a7e8be3a58516" >> /home/admin/flag.txt
RUN chmod 640 /home/admin/flag.txt
RUN chown root:admin /home/admin/flag.txt

