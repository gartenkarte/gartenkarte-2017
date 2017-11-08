#!/usr/bin/env bash

cp $out-tags-merged.json gartenkarte.json
cp $out-verlan.csv gartenkarte.csv
cp ${out}liers.csv gartenkarte-outliers.csv
cp ${out}liers.json gartenkarte-outliers.json
git add -f gartenkarte.json gartenkarte.csv gartenkarte-outliers.csv gartenkarte-outliers.json
git commit -m "build and outliers for $session"
