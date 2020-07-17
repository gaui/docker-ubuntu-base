# Superpowered Ubuntu base Docker image

**Ubuntu 20.04 (focal fossa)**

A Docker image containing:

- DOCKER_VERSION = 19.03.11
- DOCKER_COMPOSE_VERSION = 1.26.2
- GIT_VERSION = 2.27.0
- FNM_VERSION = 1.21.0
- NODE_VERSION = 13.14.0
- YARN_VERSION = 1.22.4
- TYPESCRIPT_VERSION = 3.9.7
- BABEL_VERSION = 7.10.5

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
- 7zip

## Change versions

If you want to build a new image with different versions of the above,
just use `--build-arg` with the `docker build` command.

Example:

```bash
docker build . -t myimage:mytag --build-arg UBUNTU_VERSION=19.04
```

## Changelog

### 4.0.0

- Upgrade Docker image to Ubuntu 20.04 (Focal Fossa)
- Upgrade Docker to 19.03.11
- Upgrade Git to 2.27.0
- Upgrade fnm to 1.21.0
- Upgrade Node to 13.14.0
- Upgrade Yarn to 1.22.4
- Upgrade TypeScript to 3.9.7
- Upgrade Babel to 7.10.5

### 3.2.0

- Added 7zip
- Pin NodeJS to v12.13.0 (or `$NODE_VERSION`)
- Replaced nvm with fnm (https://github.com/Schniz/fnm)

### 3.1.2

- Make nvm executable in PATH as a non-login shell (without initiating profile.d)

### 3.1.1

- Fixed installation of nvm
- Fixed entrypoint of Dockerfile

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
