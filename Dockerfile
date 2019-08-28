FROM ubuntu
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

RUN apt-get update && \
    apt-get install -y curl wget python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN pip3 install awscli --upgrade --user
ENV PATH ~/.local/bin:$PATH

ENV CONTROL_TOWER_VERSION 0.8.1

RUN wget -O control-tower https://github.com/EngineerBetter/control-tower/releases/download/$CONTROL_TOWER_VERSION/control-tower-linux-amd64 && \
    mv control-tower /usr/local/bin && \
    chmod +x /usr/local/bin/control-tower
