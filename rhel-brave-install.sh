#!/bin/bash

dnf install dnf-plugins-core

dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

dnf install brave-browser