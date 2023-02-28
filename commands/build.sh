#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd "$SCRIPT_DIR/.." || exit
PROJECT_NAME="$( basename "$( pwd )" )"
PROJECT_NAME="${PROJECT_NAME,,}"    # lowercase it

if [[ -n "$PIPELINE_BUILDX_OPTIONS" ]] ; then
    docker buildx build $PIPELINE_BUILDX_OPTIONS \
        -f "${SCRIPT_DIR}/../gitkit-deploy.dockerfile" \
        "${SCRIPT_DIR}/.."
else
    docker build -t "$PROJECT_NAME" \
        -f "${SCRIPT_DIR}/../gitkit-deploy.dockerfile" \
        "${SCRIPT_DIR}/.."
fi
