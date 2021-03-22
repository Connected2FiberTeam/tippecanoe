#!/bin/bash
# Simplify the use of the Mapbox tippecanoe application.  Switches in use when
# calling from this script to the application are outlined here:
# -o - to name the output file,
# -f - to delete the file that already exists with that name.
# -zg: Automatically choose a maxzoom that should be sufficient to clearly 
#      distinguish the features and the detail within each feature
# -r1: Do not automatically drop a fraction of points at low zoom levels, since 
#      clustering will be used instead
# -pf or --no-feature-limit: Don't limit tiles to 200,000 features
# -pk or --no-tile-size-limit: Don't limit tiles to 500K bytes
# -M  bytes or --maximum-tile-bytes=bytes: Use the specified number of bytes as 
#     the maximum compressed tile size instead of 500K.
# -Bg If you use -Bg, it will guess a zoom level that will keep at most 50,000 
#     features in the densest tile
# -as or --drop-densest-as-needed: If a tile is too large, try to reduce it to 
#     under 500K by increasing the minimum spacing between features. The 
#     discovered spacing applies to the entire zoom level.
# -aC or --cluster-densest-as-needed: If a tile is too large, try to reduce its 
#     size by increasing the minimum spacing between features, and leaving one 
#     placeholder feature from each group. 
# -as or --drop-densest-as-needed: If a tile is too large, try to reduce it to 
#     under 500K by increasing the minimum spacing between features. The 
#     discovered spacing applies to the entire zoom level.
# --extend-zooms-if-still-dropping: If even the tiles at high zoom levels are 
#     too big, keep adding zoom levels until one is reached that can represent 
#     all the features

# Start by putting the context of this script into the directory where the 
# script was found.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

if [ "$#" -gt 0 ]; then
    echo $1
    echo $2
    if [ ! -z "$1" ]; then
        if [[ ! -z "$2" && $2 == *"symbol"* ]]; then
            echo "Inside"
            errormessage=$(/data/connectedworld/libraries/tippecanoe/tippecanoe -Bg -r1 -f -o $1.mbtiles --drop-densest-as-needed $1.geojson 2>&1)
            echo $errormessage
        else
            errormessage=$(/data/connectedworld/libraries/tippecanoe/tippecanoe -zg -f -o $1.mbtiles --drop-densest-as-needed --extend-zooms-if-still-dropping $1.geojson --extend-zooms-if-still-dropping 2>&1)
        fi
            
        if [[ $errormessage == *" is not valid UTF-8"* ]]; then
            echo "Remove is not valid UTF-8" 
            iconv -f utf8 -t utf8 -c $1.geojson > $1_1.geojson
            mv -f $1_1.geojson $1.geojson
            if [[ ! -z "$2" && $2 == *"symbol"* ]]; then
                /data/connectedworld/libraries/tippecanoe/tippecanoe -Bg -r1 -f -o $1.mbtiles --drop-densest-as-needed $1.geojson 
            else
                /data/connectedworld/libraries/tippecanoe/tippecanoe -Bg -f -o $1.mbtiles --drop-densest-as-needed $1.geojson
            fi
                
        elif [[ $errormessage == *" without at least two distinct feature locations"* ]]; then
            /data/connectedworld/libraries/tippecanoe/tippecanoe -f -o $1.mbtiles --drop-densest-as-needed $1.geojson
        else
            echo $errormessage
            echo "no Exception occure"
        fi

    else
        echo "Empty Arguments"
    fi
else
   echo "No arguments supplied"
fi
