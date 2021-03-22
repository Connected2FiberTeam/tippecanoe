#!/bin/bash
# Note that we aren't bothering with deployment config because, at the time
# of this writing, there is no platform specific config for this application.

# Get the script's directory and cd from there to the root of the source dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR/..

# Clean out previous package data
rm -rf package
rm tippecanoe-package.tgz

# Create a deployable package in the package subdirectory
mkdir -p package

# Copy in the executable file,
cp tippecanoe package/

# the wrapper script,
cp tippecanoe.sh package/

# and the deploy script
cp tools/deploy.sh package/

# Tar it up
tar zcvf tippecanoe-package.tgz package
