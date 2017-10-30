#!/bin/sh

test -e /etc/ssh/ssh_host_rsa_key \
  || ssh-keygen -t rsa -b 2048 -N '' -f /etc/ssh/ssh_host_rsa_key \
  && chmod -R 600 /etc/ssh/ssh_host_rsa_key

test -e ~/.ssh/id_rsa \
  || ssh-keygen -t rsa -b 2048 -N '' -f ~/.ssh/id_rsa \
  && cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys \
  && chmod -R 600 ~/.ssh

test -e ~/.ssh-agent \
  || ssh-agent > ~/.ssh-agent

/sbin/sshd -D
