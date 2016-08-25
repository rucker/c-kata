#!/bin/bash

WORKING_DIR='/root/code/workspace'
docker run -it -w $WORKING_DIR -v `pwd`:$WORKING_DIR ubuntu-dev
