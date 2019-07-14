ARG UBUNTU_VERSION=18.10

FROM ubuntu:${UBUNTU_VERSION}

ARG DOCKER_VERSION=18.09.7
ARG GIT_VERSION=2.22.0
ARG NODE_VERSION=12
ARG YARN_VERSION=1.17.3
ARG TYPESCRIPT_VERSION=3.5.3

ENV DEBIAN_FRONTEND noninteractive
ENV NODE_PATH=/usr/lib/node_modules
ENV KUBECONFIG=kubeconfig

RUN apt-get -yqq update
RUN apt-get -yqq install gnupg curl wget software-properties-common

# Git

RUN apt-add-repository -y ppa:git-core/ppa

# Node and Yarn

RUN curl -sSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash -
RUN wget -qO - https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo deb https://dl.yarnpkg.com/debian/ stable main | tee /etc/apt/sources.list.d/yarn.list

# Other

RUN apt-get -yqq update && apt-get -yqq install \
    nodejs yarn=${YARN_VERSION}-1 git=1:${GIT_VERSION}-0ppa1~ubuntu`lsb_release -sr`.1 \
    apt-transport-https ca-certificates unzip jq  \
    iputils-ping inetutils-traceroute telnet nmap \
    dnsutils net-tools vim moreutils

RUN curl -fsSL http://releases.rancher.com/install-docker/$DOCKER_VERSION.sh | sh

# TypeScript and Babel

RUN yarn global add typescript@3.5.3 @babel/core @babel/node @babel/register @babel/preset-typescript

CMD ["/etc/bash"]
