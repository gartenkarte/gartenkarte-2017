#!/usr/bin/env bash

if [ ! -z $1 ]
  then
    a=$1
  else
    exit 1
fi

if [ ! -z $2 ]
  then
    b=$2
  else
    b=$(date +%Y%m%d-%H%M%S);
fi

source 99_template_session
export ext=csv
source 99_template_ext

./00_get.sh $i
./01_clean.sh
./02_convert.sh
./replace_types.js $out $out-tags
