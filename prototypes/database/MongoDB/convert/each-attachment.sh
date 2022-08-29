#!/bin/bash

n=1

echo "CREATE TABLE attachments(id, filename, contentType, chunkSize, uploadedDate, aliases, metadata, md5);" > attachments.sql

INSERTINTO attachments SELECT json_extract(value, '$._id.$oid

while read line; do
  #linne=$(echo "${line}" | cut -c 8-42)
  #echo "Line no $n : $line"
  oid=$(echo "$line" | jq '."_id"."$oid"')
  filename=$(echo "$line" | jq '.filename')
  contenttype=$(echo "$line" | jq '.contentType')
  chunksize=$(echo "$line" | jq '.chunkSize')
  uploadeddate=$(echo "$line" | jq '.uploadedDate."$date"')
  aliases=$(echo "$line" | jq '.["aliases"]')
  metadata=$(echo "$line" | jq '.metadata')
  md5=$(echo "$line" | jq '.md5')
  #echo "$n "
  echo "n: $n, oid: $oid, filename: $filename, contenttype: $contenttype, chunksize: $chunksize, uploadeddate: $uploadeddate, aliases: $aliases, metadata: $metadata, md5: $md5\n\n"
  echo 'INSERT INTO attachments(id, filename, contenttype, chunksize, uploadeddate, aliases, metadata, md5) VALUES($oid, $filename, $contenttype, $chunksize, $uploadeddate, "${aliases}", "${metadata}", $md5)' >> attachments.sql
  n=$((n+1))
done < exp_wekan_cfs_gridfs.attachments.files.json
