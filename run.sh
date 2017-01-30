#!/bin/bash

HOME_DIR="/home/`whoami`"
docker run -it -u `whoami` -w $HOME_DIR -v $HOME:$HOME_DIR ubuntu-dev
