FROM debian:stable-slim
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# Install required packages
RUN apt-get update && \
    apt-get install -y curl wget python3 python3-pip lsb-release build-essential zlibc zlib1g-dev ruby ruby-dev openssl libxslt1-dev libxml2-dev libssl-dev libreadline7 libreadline-dev libyaml-dev libsqlite3-dev sqlite3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# Install AWS Cli
RUN pip3 install awscli --upgrade --user
ENV PATH ~/.local/bin:$PATH	ENV PATH ~/.local/bin:$PATH

# Install GCP
RUN CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get -y update  && \
    apt-get install -y google-cloud-sdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
    
# Install Control Tower
RUN wget -O control-tower https://github.com/EngineerBetter/control-tower/releases/latest/download/control-tower-linux-amd64 && \
    mv control-tower /usr/local/bin && \
    chmod +x /usr/local/bin/control-tower

# Install CredHub
ENV CREDHUB_VERSION 2.5.3
RUN wget https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/${CREDHUB_VERSION}/credhub-linux-${CREDHUB_VERSION}.tgz && \
    tar -xzvf credhub-linux-${CREDHUB_VERSION}.tgz && \
    rm -rf credhub-linux-${CREDHUB_VERSION}.tgz && \
    mv credhub /usr/local/bin && \
    chmod +x /usr/local/bin/credhub
