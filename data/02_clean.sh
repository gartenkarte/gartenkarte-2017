#!/usr/bin/env bash

cp $i $o
dos2unix $o
vim "+set nomore" "+bufdo set fileencoding=utf8 | w" "+q" $o
xargs -a regex-repair -I {} perl -i -0777 -pe '{}' $o
xargs -a regex-unicode -I {} perl -CSD -pi -e '{}' $o
# Remove lines without coordinates
head -n 1 < $o > ${out}liers.csv
grep ";;;" $o >> ${out}liers.csv
sed -ni '/;;;/!p' $o
