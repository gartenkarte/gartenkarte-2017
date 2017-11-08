#!/usr/bin/env bash

cp $i $o
# CSV files created in Windows come with unusable text encoding, to be fixed here.
#dos2unix $o
#vim "+set nomore" "+bufdo set fileencoding=utf8 | w" "+q" $o
xargs -a regex-repair -I {} perl -i -0777 -pe '{}' $o
xargs -a regex-unicode -I {} perl -CSD -pi -e '{}' $o
# Find new lines within double quotes and replace them by spaces.
# Many kudos to https://www.linuxquestions.org/questions/linux-newbie-8/removing-multiple-lines-from-cell-data-in-a-csv-file-4175538718/#post5343293
# Requires gawk >= 4.1.0 https://stackoverflow.com/questions/16529716/awk-save-modifications-in-place
gawk -i inplace 'FPAT="([^,]+)|(\"[^\"]+\")"{x=$0;while((gsub(/\"/,"\"",x)%2)!=0){getline;x=x " ";x=x $0};$0=x;print}' $o
# Remove lines without coordinates and add those to a separate list of outliers
head -n 1 < $o > ${out}liers.csv
grep ";;;" $o >> ${out}liers.csv
sed -ni '/;;;/!p' $o
