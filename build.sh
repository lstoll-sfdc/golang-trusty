#!/usr/bin/env bash
set -euo pipefail

echo "--> Downloading go"
curl -sLo /tmp/go1.17.6.src.tar.gz https://storage.googleapis.com/golang/go1.17.6.src.tar.gz && \
echo "4dc1bbf3ff61f0c1ff2b19355e6d88151a70126268a47c761477686ef94748c8  /tmp/go1.17.6.src.tar.gz" | sha256sum -c -

echo "--> Extracting go"
rm -rf /usr/local/go
tar -C /usr/local -xzf /tmp/go1.17.6.src.tar.gz

echo "--> Building go"
export PATH="/usr/local/bootstrap-go/go/bin:$PATH"
(cd /usr/local/go/src && ./all.bash)

echo "--> Creating output tarball"
rm -rf /usr/local/go/src
rm -rf /usr/local/go/pkg/obj/go-build
cd /usr/local && tar -zcvf /build/go1.17.6.ubuntu-trusty-amd64.tar.gz go
