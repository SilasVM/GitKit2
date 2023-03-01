#!/usr/bin/env bash

# Identify the directory containing this script.
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Move to project root.
cd "${SCRIPT_DIR}/.."

# Identify the dockerfile and its build context.
DOCKERFILE="./gitkit-deploy.dockerfile"
BUILD_CONTEXT="./"

# The pipeline sets IMAGE_NAME.
# If we're running locally, it's not set.
# Set it to the project name, in lowercase.
if [[ -n "$IMAGE_NAME" ]] ; then
    IMAGE_NAME="$(basename "$(pwd)")"
    IMAGE_NAME="${IMAGE_NAME,,}"
fi

if [[ -n "$PIPELINE_BUILDX_OPTIONS" ]] ; then
    # local build
    docker build --tag "$IMAGE_NAME" --file "$DOCKERFILE" "$BUILD_CONTEXT"
else
    # pipeline build
    docker buildx build $PIPELINE_BUILDX_OPTIONS --file "$DOCKERFILE" "$BUILD_CONTEXT"
fi

