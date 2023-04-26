#!/usr/bin/env bash

# Updates all the files in this repo that have the string 'monebag' with 'samsara-dev'
# While this updates it everywhere, there are two places where it must be updated:
#  1. The hooks/command script downloads the go binary from the release directory of this GitHub project
#     so we want it to download from samsara-dev/monorepo-diff-buildkite-plugin instead of monebag/monorepo-diff-buildkite-plugin
#  2. The go binary itself checks that it is running inside of the same repo name that it was built from,
#     which is done in plugin.go.

set -e

ROOT_DIR=$(git rev-parse --show-toplevel)
cd ${ROOT_DIR}
grep -lr --exclude-dir samsara monebag | xargs sed -i '' 's|monebag|samsara-dev|g'
