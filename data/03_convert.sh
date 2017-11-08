#!/usr/bin/env bash

npm run --silent csv2geojson -- --lat "lat" --lon "lon" --delimiter ";" data/$out.csv > $out.json 2> ${out}liers.json
cat $out.json | jq -r '.features | map (.properties.types | split(";#") ) | { tags: . }' > $out-tags.json
npm run geojson2csv -- data/$out.json data/$out-verlan.csv
