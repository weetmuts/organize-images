#!/bin/bash

if [ "$1" = "" ]
then
    echo Usage: organize.sh [picture_dir]
    exit
fi

DIR=$(realpath $1)

if [ ! -d "$DIR" ]
then
    echo Not a dir: $DIR
    exit
fi

echo "Checking files"
find "$DIR" -type f \
     -iname "*.jpg"  \
     -exec jhead -ft "-n$DIR/%Y/%m/%d/%Y%m%d-%H%M%S" \{\} \;

echo "Removing empty dirs:"
find "$DIR" -type d -empty -print -delete

echo "Done."
