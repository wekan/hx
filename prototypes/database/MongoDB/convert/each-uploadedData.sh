#!/bin/bash

#n=1

rm uploaded-dates.txt

while read line; do
  #linne=$(echo "${line}" | cut -c 8-42)
  uploaddate=$(echo "$line" | jq '.uploadDate' | sed 's#"##g')
  # | sed 's#""g' -)
  #new=$(echo "$uploadeddate" | sed 's#Z##g' -)
  # | sed 's#T# #g' - | sed 's#"##g' -)
  #echo "$uploaddate $new Line no $n : $line"
  new=$(echo "$uploaddate" | sed 's#Z##g' | sed 's#T# #g' | sed 's#"##g')
  echo "$n sed -i 's#$uploaddate#$new#g' data3.json"
  echo "sed -i 's#$uploaddate#$new#g' data3.json" >> uploaded-dates.txt
  n=$((n+1))
done < data3.json


# https://stackoverflow.com/questions/23977052/sed-replacing-date-format

# I have a text file where there is a date string of "2014-06-01T03:11:00Z " in every line. I would like to replace that with "2014-06-01 03:11Z " using sed.

#sed -r -i 's/([0-9]{4}-[0-9]{2}-[0-9]{2})T([0-9]{2}:[0-9]{2}):[0-9]{2}Z/\1 \2 /g' data3.json
