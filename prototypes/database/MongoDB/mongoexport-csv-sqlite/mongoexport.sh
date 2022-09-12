rm wekan.sqlite *.csv

mongoexport --db=wekan --collection=accountSettings --type=csv --fieldFile=accountSettings-fields.txt --out=accountSettings.csv
mongoexport --db=wekan --collection=actions --type=csv --fieldFile=actions-fields.txt --out=actions.csv
mongoexport --db=wekan --collection=activities --type=csv --fieldFile=activities-fields.txt --out=activities.csv
mongoexport --db=wekan --collection=announcements --type=csv --fieldFile=announcements-fields.txt --out=announcements.csv
mongoexport --db=wekan --collection=attachments --type=csv --fieldFile=attachments-fields.txt --out=attachments.csv
mongoexport --db=wekan --collection=attachments.files --type=csv --fieldFile=attachments.files-fields.txt --out=attachments.files.csv
mongoexport --db=wekan --collection=avatars --type=csv --fieldFile=avatars-fields.txt --out=avatars.csv
mongoexport --db=wekan --collection=avatars.files --type=csv --fieldFile=avatars.files-fields.txt --out=avatars.files.csv
mongoexport --db=wekan --collection=cfs.attachments.filerecord --type=csv --fieldFile=cfs.attachments.filerecord-fields.txt --out=cfs.attachments.filerecord.csv
mongoexport --db=wekan --collection=cfs.avatars.filerecord --type=csv --fieldFile=cfs.avatars.filerecord-fields.txt --out=cfs.avatars.filerecord.csv
mongoexport --db=wekan --collection=cfs_gridfs.attachments.files --type=csv --fieldFile=cfs_gridfs.attachments.files-fields.txt --out=cfs_gridfs.attachments.files.csv
mongoexport --db=wekan --collection=cfs_gridfs.avatars.files --type=csv --fieldFile=cfs_gridfs.avatars.files-fields.txt --out=cfs_gridfs.avatars.files.csv
mongoexport --db=wekan --collection=boards --type=csv --fieldFile=boards-fields.txt --out=boards.csv
mongoexport --db=wekan --collection=cards --type=csv --fieldFile=cards-fields.txt --out=cards.csv
mongoexport --db=wekan --collection=users --type=csv --fieldFile=users-fields.txt --out=users.csv
mongoexport --db=wekan --collection=card_comment_reactions --type=csv --fieldFile=card_comment_reactions-fields.txt --out=card_comment_reactions.csv
mongoexport --db=wekan --collection=card_comments --type=csv --fieldFile=card_comments-fields.txt --out=card_comments.csv

echo ".mode csv
.import accountSettings.csv accountSettings
.import actions.csv actions
.import activities.csv activities
.import announcements.csv announcements
.import attachments.csv attachments
.import attachments.files.csv attachments.files
.import avatars.csv avatars
.import avatars.files.csv avatars.files
.import cfs.attachments.filerecord.csv cfs.attachments.filerecord
.import cfs.avatars.filerecord.csv cfs.avatars.filerecord
.import cfs_gridfs.attachments.files.csv cfs_gridfs.attachments.files
.import cfs_gridfs.avatars.files.csv cfs_gridfs.avatars.files
.import boards.csv boards
.import cards.csv cards
.import card_comments.csv card_comments
.import card_comment_reactions.csv card_comment_reactions
.import users.csv users
.quit" | sqlite3 wekan.sqlite
