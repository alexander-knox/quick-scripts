#!/bin/bash

dnf -y install postgresql-server

postgresql-setup --initdb

systemctl start postgresql.service
