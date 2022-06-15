#!/bin/bash
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

DEFAULT_PREFIX=GitKit-
export KIT_PROJECT_PREFIX="${KIT_PROJECT_PREFIX:-${DEFAULT_PREFIX}}"

deploy() {
    "${SCRIPT_DIR}"/FarmData2/deploy.sh
}

deploy
