#!/usr/bin/env bash

project="stadtacker"
i=$1-2016-$project.csv
o=$1-2017-$project.csv

cp $i $o
dos2unix $o
vim "+set nomore" "+bufdo set fileencoding=utf8 | w" "+q" $o
xargs -a regexes -I {} perl -i -0777 -pe '{}' $o
