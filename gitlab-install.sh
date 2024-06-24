#!/bin/bash

sudo dnf install -y curl policycoreutils openssh-server perl
# Enable OpenSSH server daemon if not enabled: sudo systemctl status sshd
sudo systemctl enable sshd
sudo systemctl start sshd
# Check if opening the firewall is needed with: sudo systemctl status firewalld
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo systemctl reload firewalld

# Next, install Postfix (or Sendmail) to send notification emails. If you want to use another solution to send emails please skip this step and configure an external SMTP server after GitLab has been installed

sudo dnf install postfix
sudo systemctl enable postfix
sudo systemctl start postfix

# During Postfix installation a configuration screen may appear. Select 'Internet Site' and press enter. Use your server's external DNS for 'mail name' and press enter. If additional screens appear, continue to press enter to accept the defaults.
# 2. Add the GitLab package repository and install the package

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash


# Next, install the GitLab package. Make sure you have correctly set up your DNS, and change https://gitlab.example.com to the URL at which you want to access your GitLab instance. Installation will automatically configure and start GitLab at that URL.

# For https:// URLs, GitLab will automatically request a certificate with Let's Encrypt, which requires inbound HTTP access and a valid hostname. You can also use your own certificate or just use http:// (without the s ).

# If you would like to specify a custom password for the initial administrator user ( root ), check the documentation. If a password is not specified, a random password will be automatically generated.

sudo EXTERNAL_URL="https://gitlab.example.com" dnf install -y gitlab-ee
# List available versions: sudo dnf --showduplicates list
# Specify version: sudo dnf install gitlab-ee-16.1.4-ee.0.el7
