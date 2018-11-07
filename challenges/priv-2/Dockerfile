FROM ubuntu:16.04

# Base Docker for unpriviledge SSH
RUN mkdir /home/challenge/
RUN useradd -d /home/challenge/ -s /bin/bash challenge
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Target victim of the challenge
RUN useradd admin
RUN apt-get update --fix-missing 
RUN apt-get install -y sudo vim

# Faulty permission
RUN echo "challenge ALL=(admin) NOPASSWD: /usr/bin/find" >> /etc/sudoers
RUN mkdir /home/admin/
RUN echo "FLAG-23b2d8d71d02884f37c7694c2ef423ce" >> /home/admin/flag.txt
RUN chmod 640 /home/admin/flag.txt
RUN chown root:admin /home/admin/flag.txt

