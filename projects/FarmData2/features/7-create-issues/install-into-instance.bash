#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

for issue in ./issues/* ; do
    source "${issue}"
    gh issue create --title "${title}" --body "${body}" --labels "${labels}"
