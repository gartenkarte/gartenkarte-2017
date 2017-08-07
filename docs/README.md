# Gartenkarte 2017

## Datenaufbereitung

```
# Get raw data, CSV generated with Microsoft Excel
wget -O 20160418_stadtacker_gaerten.csv https://discourse.transformap.co/uploads/default/original/1X/bf3b2aa34e93becb84ab94482902f5cb30e42a06.csv
# Create working copy, leave source intact
cp 20160418_stadtacker_gaerten.csv 20170807_stadtacker.csv
# Convert from latin1 to utf-8 after opening
# :set fileencoding=utf-8
# Adapt header values (lower-case, english)
# :x
vim 20170807_stadtacker.csv
# Generate GeoJSON
# csv2geojson --lat "lat" --lon "lon" --delimiter ";" 20170807_stadtacker.csv > 20170807_stadtacker.json
```

## Datenanalyse

```
# Get a list of all combinations of types
cat 20170807_stadtacker.json | jq -r '.features | map(.properties.types) | .[]' | sort -u > 20170807_stadtacker_types.txt
# Filter type list for occurencies of types, including number
perl -0777 -pe 's/(?<=\d);#/\n/g' 20170807_stadtacker_types.txt | sort -u
# Filter type list for occurencies of types, excluding number
perl -0777 -pe 's/(?<=\d);#/\n/g' 20170807_stadtacker_types.txt | sort -u | perl -0777 -pe 's/;#\d{1,2}|"//g'
```

```
# Extract id and type mappings
cat 20170807_stadtacker.json | jq -r '[.features | map(.properties) | to_entries[] | {"id": .value.id, "types": .value.types}]' > 20170807_stadtacker_raw_tags.json
# Get a similarily ordered array with tags
cat 20170807_stadtacker.json | jq -r '.features | map(.properties.types | split(";#") )'
# Have an addressable object with tags
cat 20170807_stadtacker.json | jq -r '[ .features | map (.properties.types | split(";#") ) | to_entries[] ] | reduce .[] as $i ({}; .[$i.key|tostring] = $i.value)' > 20170807_stadtacker_key_tags.json
# Receive a linked list of id to key mappings
cat 20170807_stadtacker.json | jq -r '[ .features | map(.properties) | to_entries[] | {"id": .value.id, "key": .key|tostring} ] | {"list": .}' > 20170807_stadtacker_linked_list_id_key.json
# Get a JSON array with the ids
cat 20170807_stadtacker.json | jq -r '.features | map(.properties.id) | { ids: . }' > 20170807_stadtacker_ids.json
# Get a JSON array with the respective tags
cat 20170807_stadtacker.json | jq -r '.features | map (.properties.types | split(";#") ) | { tags: . }' > 20170807_stadtacker_tags.json
```
