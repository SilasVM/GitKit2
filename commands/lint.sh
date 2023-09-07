#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"
cd "$SCRIPT_DIR/.." || exit

echo -e "\nRunning shellcheck\n"
docker run --rm -v "${PWD}":/app/project -w /app/project \
    registry.gitlab.com/pipeline-components/shellcheck:latest \
    /bin/sh -c \
    "find . -name .git -type d -prune -o -type f -name \*.sh -print0 |
        xargs -0 -P $(nproc) -r -n1 shellcheck"

echo -e "\nRunning markdownlint-cli2\n"
docker run --rm -v "${PWD}":/app/project  -w /app/project \
    registry.gitlab.com/pipeline-components/markdownlint-cli2:latest \
    markdownlint-cli2

echo -e "\nRunning markdown-link-check"
# shellcheck disable=SC2046
docker run --rm -v "${PWD}":/tmp:ro -w /tmp \
     ghcr.io/tcort/markdown-link-check:stable -q \
     $(find . -name '*.md' -printf '%p ')

echo -e "\nRunning hadolint\n"
docker run --rm -v "${PWD}":/app/project -w /app/project \
    registry.gitlab.com/pipeline-components/hadolint:latest \
    /bin/sh -c \
    "find . -name .git -type d -prune -o -type f  -name Dockerfile -print0 |
        xargs -0 -P $(nproc) -r -n1 hadolint"

echo -e "\nRunning eslint (for json linting only)"
docker run -v "${PWD}":/workdir -w /workdir \
    registry.gitlab.com/librefoodpantry/common-services/tools/linters/eslint:latest \
    eslint --ext .json --color .

echo -e "\nRunning yamllint\n"
docker run --rm -v "${PWD}":/app/project -w /app/project\
    registry.gitlab.com/pipeline-components/yamllint:latest \
    yamllint .

echo -e "\nRunning cspell\n"
docker run -v "${PWD}:/workdir" ghcr.io/streetsidesoftware/cspell:latest "**"

echo -e "\nRunning lint-package-json\n"
docker run -v "${PWD}:/workdir" -w /workdir \
  registry.gitlab.com/librefoodpantry/common-services/tools/linters/lint-package-json:latest \
  npmPkgJsonLint -c .npmpackagejsonlintrc.json .
