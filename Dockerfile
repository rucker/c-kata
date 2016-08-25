FROM ubuntu:14.04

env HOME=/root

# Set the timezone
RUN sudo echo "America/New_York" > /etc/timezone
RUN sudo dpkg-reconfigure -f noninteractive tzdata

# Upgrade, install packages
RUN apt-get update -qq && \
    apt-get upgrade -y
RUN apt-get install -y build-essential git pkg-config \
    automake libtool valgrind man-db indent texinfo \
    vim python-pip tree htop

# Build check
WORKDIR /tmp
RUN git clone https://github.com/libcheck/check.git && \
  cd check && \
  git checkout 0.10.0 && \
  autoreconf --install && \
  ./configure && \
  make && \
  make install && \
  ldconfig

# Set up Dotfiles
WORKDIR $HOME
RUN mkdir code && cd code && \
    git clone https://github.com/rucker/dotfiles.git && \
    pip install mock enum34 && \
    python ./dotfiles/dotfiles/dotfiles.py

# Configure Git
RUN git config --global user.name "Rick Ucker"
