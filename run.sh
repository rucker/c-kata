#!/bin/bash

DEST=/home/"${whoami}"/code/"${PWD##*/}"
docker run -it -v `pwd`:$DEST ubuntu-dev
