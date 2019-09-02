FROM debian:stable-slim
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# Install required packages
RUN apt-get update && \
    apt-get install -y wget build-essential zlibc zlib1g-dev ruby ruby-dev openssl libxslt1-dev libxml2-dev libssl-dev libreadline7 libreadline-dev libyaml-dev libsqlite3-dev sqlite3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# Install Control Tower
ENV CONTROL_TOWER_VERSION 0.8.1
RUN wget -O control-tower https://github.com/EngineerBetter/control-tower/releases/download/$CONTROL_TOWER_VERSION/control-tower-linux-amd64 && \
    mv control-tower /usr/local/bin && \
    chmod +x /usr/local/bin/control-tower
