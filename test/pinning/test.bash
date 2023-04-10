#!/usr/bin/env bash

docker build -f test/pinning/Dockerfile -t gitkit-tester .
docker run --rm  gitkit-tester bats --tap test/pinning/test.bats
