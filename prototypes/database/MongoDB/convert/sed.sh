## works:
#sed -i 's#{"_id":{"$oid":#{"id":#g' data.json

## works:
#sed -i 's#},"filename#,"filename#g' data.json

## works:
#sed -i 's#},"aliases#,"aliases#g' data.json


sed -i 's#.jpg.jpeg#.jpg#g' data2.json

#function urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }

#sed -i 's/%([0-9a-fA-F]{2})/\\x\1/g;s/\+/ /g' data.json

## works:
#sed -i 's#{"$date":##g' data.json
#sed -i 's#"aliases":\[#"aliases":#g' data.json
#sed -i 's#\],"metadata":#,"metadata":#g' data.json




#replace:
#,"uploadDate":{"$date":
#,"uploadDate":{"$date":
#
#with:
#,"uploadDate":

