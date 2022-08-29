#mongofiles --port 27019 -d wekan --prefix 'cfs_gridfs.attachments' get_regex *
mongofiles --port 27019 -d wekan --prefix 'cfs_gridfs.attachments' get_id '{ "$oid": "58795698033ae7210421a033" }'
