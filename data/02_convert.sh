#!/usr/bin/env bash

csv2geojson --lat "lat" --lon "lon" --delimiter ";" $out.csv > $out.json
cat $out.json | jq -r '.features | map (.properties.types | split(";#") ) | { tags: . }' > $out-tags.json
