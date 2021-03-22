#!/bin/bash
# Get the script's directory and cd from there to the root of the source dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR/..

echo
echo "Note that the tippecanoe build MUST be done for the target system OS."
echo "This can be performed either on a system with the same OS or with "
echo "cross-compile tools."
echo

# g++/make build for the local system OS
make

