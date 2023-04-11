#!/usr/bin/env bash

docker build --target without-source --file test/pinning/Dockerfile --tag make-gold .
docker run --rm  -v "${PWD}:/w" -w /w make-gold bats --tap test/pinning
cp .temp/test/pinning/trace.txt test/pinning/gold.raw
