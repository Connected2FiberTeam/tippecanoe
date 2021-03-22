#!/bin/bash
# Get the script's directory and cd from there to the root of the source dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR/..

# gradle clean
make clean

# Get rid of any packages
rm tippecanoe-package.tgz
rm -rf package

