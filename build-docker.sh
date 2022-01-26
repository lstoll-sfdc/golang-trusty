#!/usr/bin/env bash
set -euo pipefail

docker build -t trusty-golang-builder .
docker run --rm -v "$(pwd):/build" trusty-golang-builder /build/build.sh
