#!/usr/bin/env bash

if [ $# = 0 ]; then
    echo "USAGE: test.sh image-name";
    echo ""
    echo " - image-name: Name of docker image to run tests against"
    exit 1
fi

set -x

# Install Composer
docker run --rm -v composer:/composer "$1"

# Test composer works
docker run --rm -v composer:/composer -v $(pwd)/tests:/project "$1" --version

# BC check - for when their wasn't an entry script
docker run --rm -v composer:/composer -v $(pwd)/tests:/project "$1" composer --version
