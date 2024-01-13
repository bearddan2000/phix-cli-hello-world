FROM ubuntu:22.04

# use a default value just in case
ARG PHIX_VERSION=1.0.4

COPY install_phix.sh /tmp/

RUN apt-get update && \
    apt-get install -y wget unzip && \
    /tmp/install_phix.sh "${PHIX_VERSION}" && \
    rm -f /tmp/install_phix.sh && \
    apt-get remove -y wget unzip && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*
