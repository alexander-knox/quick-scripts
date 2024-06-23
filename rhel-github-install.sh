#!/bin/bash

# The steps for this installation were copied from a github repository belonging to a github developer
# The repository is linked here: https://github.com/shiftkey/desktop

# Import gpg keys from shiftkey.dev using the rpm package manager
rpm --import https://rpm.packages.shiftkey.dev/gpg.key

# echoing some URI for mirrors containing the github-desktop application to the yum repos directory
sh -c 'echo -e "[mwt-packages]\nname=GitHub Desktop\nbaseurl=https://mirror.mwt.me/shiftkey-desktop/rpm\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://mirror.mwt.me/shiftkey-desktop/gpgkey" > /etc/yum.repos.d/mwt-packages.repo'

dnf install github-desktop

