# syntax=docker/dockerfile:experimental

ARG UBUNTU_VERSION=20.04

FROM ubuntu:${UBUNTU_VERSION}

ARG DOCKER_VERSION=19.03.11
ARG DOCKER_COMPOSE_VERSION=1.26.2
ARG GIT_VERSION=2.27.0
ARG FNM_VERSION=1.21.0
ARG NODE_VERSION=13.14.0
ARG YARN_VERSION=1.22.4
ARG TYPESCRIPT_VERSION=3.9.7
ARG BABEL_VERSION=7.10.5

ENV NODE_VERSION=${NODE_VERSION}
ENV NODE_PATH=/usr/lib/node_modules
ENV KUBECONFIG=kubeconfig
ENV FNM_DIR /root/.fnm
ENV FNM_INTERACTIVE_CLI false

WORKDIR /tmp

COPY ./entrypoint.sh .

RUN apt-get -yqq update && apt-get -yqq install \
    gnupg curl wget software-properties-common apt-transport-https \
    p7zip-full unzip xz-utils ca-certificates

# Git

RUN apt-add-repository -y ppa:git-core/ppa

# fnm (Node Version Manager)

RUN wget -q https://github.com/Schniz/fnm/releases/download/v${FNM_VERSION}/fnm-linux.zip \
    && unzip -j fnm-linux.zip \
    && chmod +x fnm \
    && mv fnm /usr/local/bin/

# Yarn

RUN wget -qO - https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo deb https://dl.yarnpkg.com/debian/ stable main | tee /etc/apt/sources.list.d/yarn.list

# Docker

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu `lsb_release -cs` stable" \
    && curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# Install all packages

RUN apt-get -yqq update && apt-get -yqq install \
    yarn=${YARN_VERSION}-1 git=1:${GIT_VERSION}-1~ppa0~ubuntu`lsb_release -sr`.1 \
    unzip iputils-ping inetutils-traceroute telnet nmap dnsutils net-tools vim \
    jq moreutils docker-ce=5:${DOCKER_VERSION}~3-0~ubuntu-`lsb_release -cs` \
    docker-ce-cli=5:${DOCKER_VERSION}~3-0~ubuntu-`lsb_release -cs`

# TypeScript and Babel

RUN yarn global add \
    typescript@${TYPESCRIPT_VERSION} @babel/core@${BABEL_VERSION} \
    @babel/node@${BABEL_VERSION} @babel/preset-typescript

ENTRYPOINT ["/bin/bash", "./entrypoint.sh"]
