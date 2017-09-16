#!/usr/bin/env bash

cp $out-tags-merged.json gartenkarte.json
cp ${out}liers.csv gartenkarte-outliers.csv
git add -f gartenkarte.json gartenkarte-outliers.csv
git commit -m "update gartenkarte.json"
