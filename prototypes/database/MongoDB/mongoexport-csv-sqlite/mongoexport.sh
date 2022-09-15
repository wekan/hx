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
mongoexport --db=wekan --collection=card_comment_reactions --type=csv --fieldFile=card_comment_reactions-fields.txt --out=card_comment_reactions.csv
mongoexport --db=wekan --collection=card_comments --type=csv --fieldFile=card_comments-fields.txt --out=card_comments.csv
mongoexport --db=wekan --collection=checklists --type=csv --fieldFile=checklists-fields.txt --out=checklists.csv
mongoexport --db=wekan --collection=checklistItems --type=csv --fieldFile=checklistItems-fields.txt --out=checklistItems.csv
mongoexport --db=wekan --collection=customFields --type=csv --fieldFile=customFields-fields.txt --out=customFields.csv
mongoexport --db=wekan --collection=impersonatedUsers --type=csv --fieldFile=impersonatedUsers-fields.txt --out=impersonatedUsers.csv
mongoexport --db=wekan --collection=integrations --type=csv --fieldFile=integrations-fields.txt --out=integrations.csv
mongoexport --db=wekan --collection=lists --type=csv --fieldFile=lists-fields.txt --out=lists.csv
mongoexport --db=wekan --collection=org --type=csv --fieldFile=org-fields.txt --out=org.csv
mongoexport --db=wekan --collection=orgUser --type=csv --fieldFile=orgUser-fields.txt --out=orgUser.csv
mongoexport --db=wekan --collection=rules --type=csv --fieldFile=rules-fields.txt --out=rules.csv
mongoexport --db=wekan --collection=settings --type=csv --fieldFile=settings-fields.txt --out=settings.csv
mongoexport --db=wekan --collection=swimlanes --type=csv --fieldFile=swimlanes-fields.txt --out=swimlanes.csv
mongoexport --db=wekan --collection=tableVisibilityModeSettings --type=csv --fieldFile=tableVisibilityModeSettings-fields.txt --out=tableVisibilityModeSettings.csv
mongoexport --db=wekan --collection=team --type=csv --fieldFile=team-fields.txt --out=team.csv
mongoexport --db=wekan --collection=users --type=csv --fieldFile=users-fields.txt --out=users.csv

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
.import checklists.csv checklists
.import checklistItems.csv checklistItems
.import customFields.csv customFields
.import impersonatedUsers.csv impersonatedUsers
.import integrations.csv integrations
.import lists.csv lists
.import org.csv org
.import orgUser.csv orgUser
.import rules.csv rules
.import settings.csv settings
.import swimlanes.csv swimlanes
.import tableVisibilityModeSettings.csv tableVisibilityModeSettings
.import team.csv team
.import users.csv users
.quit" | sqlite3 wekan.sqlite
