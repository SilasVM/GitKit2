#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )"

if [ "$2" = "add" ] && [ "$3" = "upstream" ] ; then
    # We know this exists. We put it there.
    # shellcheck disable=SC1091
    source "$SCRIPT_DIR/../5-detect-upstream-clone/upstream-location.sh"
    UPSTREAM_URL="$(load-upstream-location)"
    if [ "$4" != "$UPSTREAM_URL" ] ; then
        echo "*********************************************************************"
        printf "\xF0\x9F\x98\xBA\xF0\x9F\x92\xBB Meow, Kit-tty here!\n"
        echo
        echo "I think you have the wrong URL for 'upstream'."
        echo "One of the following is probably the problem:"
        echo
        echo "  * The URL points to your fork."
        echo "  * The URL points to the original, real project."
        echo "  * The URL is not an appropriate clone URL (it should end in .git)."
        echo "  * The URL is not using HTTPS."
        echo
        echo "To get the correct URL, in a Web-browser:"
        echo
        echo "  1. Navigate to your fork"
        echo "  2. Click the link near the top that follows 'forked from'."
        echo "  3. Click the 'Code' pill."
        echo "  4. Select 'Local' and 'HTTPS'"
        echo "  5. Click the copy button."
        echo
        echo "Now try to create the 'upstream' remote again."
        echo "*********************************************************************"
        exit 1
    fi
fi
