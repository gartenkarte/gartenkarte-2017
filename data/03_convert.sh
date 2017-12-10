#!/usr/bin/env bash

cp $i $o

npm run --silent csv2geojson -- --lat "lat" --lon "lon" --delimiter "," data/$out.csv > $out.json 2> ${out}liers.json
cat $out.json | jq -r '.features | map (.properties.types | split(";#") ) | { tags: . }' > $out-tags.json
npm run geojson2csv -- data/$out.json data/$out-verlan.csv

# Remove lines without coordinates and add those to a separate list of outliers
head -n 1 < $o > ${out}liers.csv
egrep -x "^.*;;$" $o >> ${out}liers.csv
sed -in '/^.*;;$/d' $o
