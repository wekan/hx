mongoexport --db=wekan --collection=users --type=csv --fieldFile=users-fields.txt --out=users.csv

echo ".mode csv
.import users.csv users
.quit" | sqlite3 wekan.sqlite

