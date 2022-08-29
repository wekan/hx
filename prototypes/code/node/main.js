//const db = require('better-sqlite3')('wekan.db', options);
const db = require('better-sqlite3')('wekan.db');

//const row = db.prepare('SELECT * FROM users WHERE id = ?').get(userId);
const row = db.prepare('SELECT * FROM users LIMIT 1');
//.get(userId);

console.log(row.firstName, row.lastName, row.email);

db.close();


/*
var sqlite3 = require('sqlite3').verbose();
var db = new sqlite3.Database(':memory:');

db.serialize(function() {
  db.run("CREATE TABLE lorem (info TEXT)");

  var stmt = db.prepare("INSERT INTO lorem VALUES (?)");
  for (var i = 0; i < 10; i++) {
      stmt.run("Ipsum " + i);
  }
  stmt.finalize();

  db.each("SELECT rowid AS id, info FROM lorem", function(err, row) {
      console.log(row.id + ": " + row.info);
  });
});

db.close();
*/
