# Superpowered Ubuntu base Docker image

**Ubuntu 18.10 (cosmic)**

A Docker image containing:

- DOCKER_VERSION = 19.03.4
- DOCKER_COMPOSE_VERSION = 1.24.1
- GIT_VERSION = 2.22.0
- NVM_VERSION = 0.35.0
- NODE_VERSION = 12
- YARN_VERSION = 1.19.1
- TYPESCRIPT_VERSION = 3.6.4
- BABEL_VERSION = 7.6.3

And some Linux utilities:

- wget
- unzip
- jq
- iputils-ping
- iputils-traceroute
- telnet
- nmap
- dnsutils
- net-tools
- vim
- moreutils

## Change versions

If you want to build a new image with different versions of the above,
just use `--build-arg` with the `docker build` command.

Example:

```bash
docker build . -t myimage:mytag --build-arg UBUNTU_VERSION=19.04
```

## Changelog

### 3.1.0

- Use nvm to manage Node versions

### 3.0.0

- Ubuntu 18.10 (cosmic)
- Docker CE 19.03.4 (Engine + CLI)
- Docker Compose 1.24.1
- Node 12
- Yarn 1.19.1
- TypeScript 3.6.4
- Babel 7.6.3 (Core + Node)

### 2.0.0

- Ubuntu 18.10 (cosmic)
- Docker 18.09.7
- Git 2.22.0
- Node 12
- Yarn 1.16.3
- TypeScript 3.5 + Babel instead of ts-node

### 1.1.0

- Added Git 2.18.0
- Added `moreutils` package
- Upgraded TypeScript to 3.0.3 (pinned version)

### 1.0.0

- Initial release
