FROM ubuntu
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# Install required packages
RUN apt-get update && \
    apt-get install -y lsb-release curl wget python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# Install AWS Cli
RUN pip3 install awscli --upgrade --user
ENV PATH ~/.local/bin:$PATH

# Install GCP
RUN CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get -y update  && \
    apt-get install -y google-cloud-sdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

ENV CONTROL_TOWER_VERSION 0.8.1

RUN wget -O control-tower https://github.com/EngineerBetter/control-tower/releases/download/$CONTROL_TOWER_VERSION/control-tower-linux-amd64 && \
    mv control-tower /usr/local/bin && \
    chmod +x /usr/local/bin/control-tower
