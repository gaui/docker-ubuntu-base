ARG UBUNTU_VERSION=18.10

FROM ubuntu:${UBUNTU_VERSION}

SHELL ["bash", "-c"]

ARG DOCKER_VERSION=19.03.4
ARG DOCKER_COMPOSE_VERSION=1.24.1
ARG GIT_VERSION=2.22.0
ARG NVM_VERSION=0.35.0
ARG NODE_VERSION=12
ARG YARN_VERSION=1.19.1
ARG TYPESCRIPT_VERSION=3.6.4
ARG BABEL_VERSION=7.6.3

ENV DEBIAN_FRONTEND noninteractive
ENV NODE_PATH=/usr/lib/node_modules
ENV KUBECONFIG=kubeconfig

WORKDIR /tmp

RUN apt-get -yqq update && apt-get -y install \
    gnupg curl wget software-properties-common apt-transport-https \
    ca-certificates

# Git

RUN apt-add-repository -y ppa:git-core/ppa

# nvm

ENV NVM_DIR /root/.nvm
RUN wget -qO nvm.sh https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh \
    && chmod +x nvm.sh \
    && ./nvm.sh
COPY ./files/nvm.sh /usr/local/bin/nvm
RUN chmod +x /usr/local/bin/nvm

# Yarn

RUN wget -qO - https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo deb https://dl.yarnpkg.com/debian/ stable main | tee /etc/apt/sources.list.d/yarn.list

# Docker

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu `lsb_release -cs` stable" \
    && curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# Install all packages

RUN apt-get -yqq update && apt-get -y install \
    yarn=${YARN_VERSION}-1 git=1:${GIT_VERSION}-0ppa1~ubuntu`lsb_release -sr`.1 \
    unzip iputils-ping inetutils-traceroute telnet nmap dnsutils net-tools vim \
    jq moreutils docker-ce=5:${DOCKER_VERSION}~3-0~ubuntu-`lsb_release -cs` \
    docker-ce-cli=5:${DOCKER_VERSION}~3-0~ubuntu-`lsb_release -cs`

# TypeScript and Babel

RUN yarn global add \
    typescript@${TYPESCRIPT_VERSION} @babel/core@${BABEL_VERSION} \
    @babel/node@${BABEL_VERSION} @babel/preset-typescript
