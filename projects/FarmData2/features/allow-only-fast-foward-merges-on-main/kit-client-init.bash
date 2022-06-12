#!/bin/bash

## This script is called once after the instance is cloned by a KitClient.
## It runs in the clone of the instance in a KitClient.

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH-SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

"$SCRIPT_DIR/allow-only-fast-forward-merges-on-main.bash"
