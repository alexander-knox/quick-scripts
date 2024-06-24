#!/bin/bash

sudo dnf install -y curl policycoreutils openssh-server perl

# enable ssh
sudo systemctl enable sshd
sudo systemctl start sshd

# firewalld checks
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo systemctl reload firewalld

# add postfix for emails
sudo dnf install postfix
sudo systemctl enable postfix
sudo systemctl start postfix
# if postfix install opens configuration options, select 'Internet Site' and enter.
# use server's external DNS for 'mail name' and enter
# add gitlab repo and install

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash


# set dns && change https://gitlab.example.com to preferred url
sudo EXTERNAL_URL="https://gitlab.example.com" dnf install -y gitlab-ee

# List available versions: sudo dnf --showduplicates list
# Specify version: sudo dnf install gitlab-ee-16.1.4-ee.0.el7
