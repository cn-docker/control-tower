FROM ubuntu
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

ENV CONTROL_TOWER_VERSION 0.8.1

RUN wget -O control-tower https://github.com/EngineerBetter/control-tower/releases/download/$CONTROL_TOWER_VERSION/control-tower-linux-amd64 && \
    mv control-tower /usr/local/bin && \
    chmod +x /usr/local/bin/control-tower
