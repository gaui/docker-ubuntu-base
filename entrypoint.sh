#!/bin/bash

# Initialize fnm

NODE_DIR=`dirname $FNM_DIR`/`basename $FNM_DIR`/current
SYMLINK_DIR=`readlink $NODE_DIR | grep $NODE_VERSION`

if [ -z "$SYMLINK_DIR" ]; then
  eval `fnm env` 2>&1>/dev/null
  fnm install $NODE_VERSION 2>&1>/dev/null
  fnm default $NODE_VERSION 2>&1>/dev/null
  fnm use default 2>&1>/dev/null
fi

exec "$@"
