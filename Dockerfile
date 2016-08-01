FROM ubuntu:14.04

RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install -y build-essential
RUN apt-get install -y cmake libgtest-dev valgrind \
    git pkg-config automake libtool check

# Man pages and indent to keep myself sane
RUN apt-get install -y man-db indent
RUN apt-get install -y texinfo

# ----------- Build gtest ------------
RUN cd /usr/src/gtest && \
    cmake CMakeLists.txt && \
    make && \
    cp *.a /usr/lib
# ------------------------------------

RUN apt-get install -y vim python-pip tree htop
ENV APP_HOME /root/code/kata

# ------------ Build check ------------
WORKDIR /tmp
RUN git clone https://github.com/libcheck/check.git && \
  cd check && \
  git checkout 0.10.0 && \
  autoreconf --install && \
  ./configure && \
  make && \
  make install && \
  ldconfig
# -------------------------------------

# ---------- Dotfiles -----------------
WORKDIR ~
RUN mkdir code && \
    cd code && \
    git clone https://github.com/rucker/dotfiles.git && \
    pip install mock enum34 && \
    python ./dotfiles/dotfiles/dotfiles.py
# -------------------------------------

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

#ADD . $APP_HOME/
