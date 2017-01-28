#!/bin/bash

docker run -it -u `whoami` -w $HOME -v $HOME:$HOME ubuntu-dev
