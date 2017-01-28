FROM ubuntu:latest
ARG user=$USER

# Set the timezone
RUN echo "America/New_York" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN useradd $user

# Upgrade, install packages
RUN apt-get update -qq && \
    apt-get upgrade -y
RUN apt-get install -y vim tree htop
