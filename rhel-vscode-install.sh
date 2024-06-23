#! bin/bash

rpm --import https://packages.microsoft.com/keys/microsoft.asc
rpm --import https://packages.microsoft.com/yumrepos/vscode

touch /etc/yum.repos.d/vscode.repo

echo -e "[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo

yum install -y code
