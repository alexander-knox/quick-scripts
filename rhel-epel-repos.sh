#!/bin/bash

subscription-manager repos --enable codeready-builder-for-rhel-9-x86_64-rpms
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
