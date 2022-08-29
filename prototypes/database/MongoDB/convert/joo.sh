#head -1 exp_wekan_cfs_gridfs.attachments.files.json | jq -r 'keys | @csv'

cp exp_wekan_cfs_gridfs.attachments.files.json data.json

(head -1 data.json | jq -r 'keys | @csv' && jq -r '[.[]] | @csv' < data.json) > data.csv
#head -1 exp_wekan_cfs_gridfs.attachments.files.json | jq -r 'keys | @csv'
