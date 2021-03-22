#!/bin/bash
# Get the script's directory and cd from there to the root of the source dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

# Create the deployment locations
mkdir -p /data/connectedworld/libraries/tippecanoe
mkdir -p /data/connectedworld/scripts

# Copy over the executable and make sure it's runnable
cp tippecanoe /data/connectedworld/libraries/tippecanoe/
chmod 755 /data/connectedworld/libraries/tippecanoe/tippecanoe

# Copy over the script and make sure it's runnable
cp tippecanoe.sh /data/connectedworld/scripts/
chmod 755 /data/connectedworld/scripts/tippecanoe.sh
