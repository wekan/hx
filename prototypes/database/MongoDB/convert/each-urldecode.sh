#!/bin/bash

n=1

function urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }

while read line; do
  y=$(urldecode "$line")
  echo "$y" >> data2.json
  echo "$n "
  n=$((n+1))
done < data.json
