#!/bin/bash

jupyter notebook  --no-browser --ip=* --NotebookApp.token="" --allow-root &
sudo /usr/sbin/sshd -D
