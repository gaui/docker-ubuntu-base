# Superpowered Ubuntu base image

A Docker image containing:

- Ubuntu 18.10 (cosmic)
- Docker 18.09.7
- Git 2.22.0
- Node 12
- Yarn 1.16.3
- TypeScript 3.5 (+babel)

And some Linux packages:

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
