#!/usr/bin/env bash

# Build the go binary for this plugin for linux x86-64
# This is the only instance type that we use for Buildkite as far as I know

set -e

ROOT_DIR=$(git rev-parse --show-toplevel)
cd ${ROOT_DIR}
GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o monorepo-diff-buildkite-plugin_linux_amd64

