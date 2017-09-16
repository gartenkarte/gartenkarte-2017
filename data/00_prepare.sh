#!/usr/bin/env bash

if [ ! -z $1 ]
  then
    a=$1
  else
    echo "No arguments provided. Aborting."
    exit 1
fi

if [ ! -z $2 ]
  then
    b=$2
  else
    echo "No run provided. Loading defaults."
    b=$(date +%Y%m%d-%H%M%S)
fi

echo "Project: $a"
echo "Run: $b"

hash csv2geojson 2>/dev/null || { echo >&2 "csv2geojson not installed, check your Node.js/NVM setup.  Aborting." ; exit 1; }

source 99_template_session
export ext=csv
source 99_template_ext

./01_get.sh $i
./02_clean.sh
./03_convert.sh
./replace_types.js $out $out-tags

./04_bundle.sh
