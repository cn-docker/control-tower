FROM debian:stable-slim
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# Install required packages
RUN apt-get update && \
    apt-get install -y wget build-essential zlibc zlib1g-dev ruby ruby-dev openssl libxslt1-dev libxml2-dev libssl-dev libreadline7 libreadline-dev libyaml-dev libsqlite3-dev sqlite3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# Install Control Tower
RUN wget -O control-tower https://github.com/EngineerBetter/control-tower/releases/latest/download/control-tower-linux-amd64 && \
    mv control-tower /usr/local/bin && \
    chmod +x /usr/local/bin/control-tower
