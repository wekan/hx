#!/bin/bash

#n=1


# https://stackoverflow.com/questions/23977052/sed-replacing-date-format

# I have a text file where there is a date string of "2014-06-01T03:11:00Z " in every line. I would like to replace that with "2014-06-01 03:11Z " using sed.

#sed -r -i 's/([0-9\-]{4}-[0-9]{2}-[0-9]{2})T([0-9]{2}:[0-9]{2}):[0-9]{3}Z/\1 \2Z/g' data3.json
sed -r -i 's/([0-9\-]{10})T([0-9\:]{9})Z/\1 \2 /g' data3.json


#sed -r -i 's/([0-9\-]{10})T([0-9]{2}:[0-9]{2}):[0-9]{3}Z/\1 \2Z/g' data3.json
