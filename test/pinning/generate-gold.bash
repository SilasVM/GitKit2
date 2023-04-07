#!/usr/bin/env bash

docker build --target without-source --file test/pinning/Dockerfile --tag generate-pinning-gold .
docker run --rm  -v "${PWD}:/w" -w /w generate-pinning-gold bats --tap test
cp .temp/test/pinning/trace.txt test/pinning/gold.raw
