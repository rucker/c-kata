#!/bin/bash

ENV="-e SHELL=/bin/bash"

if [[ $1 == "-u" ]]; then
    USER=$(whoami)
    HOME_DIR="/home/${USER}"
    docker run -it -u ${USER} -w ${HOME_DIR} ${ENV} -v ${HOME}:${HOME_DIR} ubuntu-dev
else
    docker run -it ${ENV} ubuntu-dev
fi
