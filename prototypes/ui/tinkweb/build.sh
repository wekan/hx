echo "Deleting .build:"
rm -rf .build

echo "Creating directory .build:"
mkdir -p .build/node .build/php

echo "Building node:"
haxe -js .build/node/server.js -lib hxnodejs -lib tink_web -main Server

echo "Building php:"
haxe -php .build/php -main Server -lib tink_web
