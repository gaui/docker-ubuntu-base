# Superpowered Ubuntu base image

A Docker image containing:

- Ubuntu 18.04
- Docker 18.06.0
- Git 2.18.0
- Node 10
- Yarn 1.9.4
- TypeScript 3.0.3 (+ts-node)

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
docker build . -t myimage:mytag --build-arg UBUNTU_VERSION=16.04
```

## Changelog

### 1.1.0

- Added Git 2.18.0
- Added `moreutils` package
- Upgraded TypeScript to 3.0.3 (pinned version)

### 1.0.0

- Initial release
