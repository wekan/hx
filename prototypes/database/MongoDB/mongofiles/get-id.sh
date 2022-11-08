#mongofiles --port 27019 -d wekan --prefix 'cfs_gridfs.attachments' get_regex *
#mongofiles --port 27019 -d wekan --prefix 'cfs_gridfs.attachments' get_id '{ "$oid": "58795698033ae7210421a033" }'
mongofiles --port 27019 -d wekan --prefix 'cfs_gridfs.attachments' get_id 'ObjectId("596f9f715f1dffbc63c20d9e")'
