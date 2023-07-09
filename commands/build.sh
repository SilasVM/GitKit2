#!/usr/bin/env bash
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "${SCRIPT_DIR}/.." || exit

DOCKERFILE="./gitkit-deploy.dockerfile"
BUILD_CONTEXT="./"

# Used when called locally (i.e., not in pipeline)
LOCAL_IMAGE_NAME="gitkit:dev"

if [[ -n "$PIPELINE_BUILDX_BUILD_OPTIONS" ]] ; then
    # multi-platform, in-pipeline build
    docker buildx build "$PIPELINE_BUILDX_BUILD_OPTIONS" \
        --file "$DOCKERFILE" "$BUILD_CONTEXT"
elif [[ -n "$PIPELINE_IMAGE_NAME" ]] ; then
    # single, default-platform, in-pipeline build
    docker build --tag "$PIPELINE_IMAGE_NAME" \
        --file "$DOCKERFILE" "$BUILD_CONTEXT"
else
    # single, default-platform, local build
    docker build --tag "$LOCAL_IMAGE_NAME" \
        --file "$DOCKERFILE" "$BUILD_CONTEXT"
fi
