#!/usr/bin/env bash

if [ -z $1 ];
  then
    a=$(date +%Y%m%d-%H%M%S);
  else
    a=$1	  
fi

./00_get.sh $a
./01_clean.sh $a
