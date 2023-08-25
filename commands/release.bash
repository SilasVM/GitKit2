#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Pass a SemVer version number for the first parameter (e.g., 1.2.3)"
    echo
    echo "    ./bin/release.bash <semver>"
    echo
    exit 1
fi

MAJOR_MINOR_PATCH="${1}"
MAJOR_MINOR=""
MAJOR=""

# shellcheck disable=SC2034
PLATFORMS="linux/amd64,linux/arm64"
REGISTRY=registry.gitlab.com/hfossedu/kits
NAME=gitkit
# shellcheck disable=SC2034
BRANCH="$(git branch --show-current)"
IMAGE_BASE="$REGISTRY/$NAME"
IMAGE_TO_RELEASE="$IMAGE_BASE:main"


main() {
    multi_platform_release_image "$@" && git tag "$1" && git push --tags
}


multi_platform_release_image() {
    parse-version "$1"

    AMENDMENTS=""
    while read -r sha ; do
        AMENDMENTS+=" --amend $IMAGE_BASE@$sha"
    done <<< "$(docker manifest inspect $IMAGE_TO_RELEASE | jq -r '.manifests[].digest')"

    echo "AMENDMENTS=$AMENDMENTS"

    create_and_push_manifest "$MAJOR" "$AMENDMENTS"
    create_and_push_manifest "$MAJOR_MINOR" "$AMENDMENTS"
    create_and_push_manifest "$MAJOR_MINOR_PATCH" "$AMENDMENTS"
    create_and_push_manifest latest "$AMENDMENTS"
}

parse-version() {
    MAJOR_MINOR_PATCH="${1}"
    MAJOR_MINOR="$(drop-last-component "$MAJOR_MINOR_PATCH")"
    MAJOR="$(drop-last-component "$MAJOR_MINOR")"
}

drop-last-component() {
    echo "${1%.*}"
}

create_and_push_manifest() {
    set -x
    IMAGE="$IMAGE_BASE:$1"
    docker manifest create "$IMAGE" $2
    docker manifest push "$IMAGE"
    set +x
}

main "$@"

