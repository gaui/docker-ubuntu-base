ARG UBUNTU_VERSION=18.04

FROM ubuntu:${UBUNTU_VERSION}

ARG DOCKER_VERSION=18.06.0
ARG NODE_VERSION=10
ARG YARN_VERSION=1.9.4

ENV DEBIAN_FRONTEND noninteractive
ENV NODE_PATH=/usr/lib/node_modules
ENV KUBECONFIG=kubeconfig

RUN apt-get -yqq update
RUN apt-get -yqq install gnupg curl

# Node and Yarn
RUN curl -sSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash -
RUN curl -sSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo deb https://dl.yarnpkg.com/debian/ stable main | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get -yqq update && apt-get -yqq install \
    nodejs yarn=${YARN_VERSION}-1 \
    apt-transport-https ca-certificates gnupg wget unzip jq software-properties-common \
    iputils-ping inetutils-traceroute telnet nmap \
    dnsutils net-tools vim git

RUN curl -fsSL http://releases.rancher.com/install-docker/$DOCKER_VERSION.sh | sh

# TypeScript and ts-node

RUN yarn global add typescript ts-node

CMD ["/etc/bash"]
