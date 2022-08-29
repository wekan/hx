rm wekan.sqlite *.csv

mongoexport --db=wekan --collection=users --type=csv --fieldFile=users-fields.txt --out=users.csv
mongoexport --db=wekan --collection=accountSettings --type=csv --fieldFile=accountSettings-fields.txt --out=accountSettings.csv

echo ".mode csv
.import accountSettings.csv accountSettings
.import users.csv users
.quit" | sqlite3 wekan.sqlite

