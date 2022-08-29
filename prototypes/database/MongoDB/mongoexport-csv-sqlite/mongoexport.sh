rm wekan.sqlite *.csv

mongoexport --db=wekan --collection=users --type=csv --fieldFile=users-fields.txt --out=users.csv
mongoexport --db=wekan --collection=accountSettings --type=csv --fieldFile=accountSettings-fields.txt --out=accountSettings.csv
mongoexport --db=wekan --collection=actions --type=csv --fieldFile=actions-fields.txt --out=actions.csv
mongoexport --db=wekan --collection=activities --type=csv --fieldFile=activities-fields.txt --out=activities.csv

echo ".mode csv
.import accountSettings.csv accountSettings
.import actions.csv actions
.import activities.csv activities
.import users.csv users
.quit" | sqlite3 wekan.sqlite

