#!/bin/bash
if [ -z `command -v psql` ]; then sudo apt update && sudo apt install -y postgresql postgresql-contrib; fi

sudo service postgresql start
sudo -u postgres createuser $USER -P --interactive
