#!/bin/bash

#curl -o redbean.com https://justine.lol/redbean/redbean-latest.com
chmod +x redbean.com
cp -p redbean-latest.com redbean.com
rm -rf assets tmpl .lua
cp ~/repos/fullmoon/examples/htmxboard/htmxboard.lua .init.lua
mkdir .lua
cp ~/repos/fullmoon/fullmoon.lua .lua/
cp -pR ~/repos/fullmoon/examples/htmxboard/assets .
cp -pR ~/repos/fullmoon/examples/htmxboard/tmpl .

zip redbean.com .init.lua .lua/fullmoon.lua assets/styles.css \
tmpl/board.fmg tmpl/card.fmg tmpl/icon-edit.fmt  tmpl/index.fmg \
tmpl/list.fmg tmpl/state-show.fmt tmpl/card-edit.fmg  \
tmpl/icon-close.fmt tmpl/icon-plus.fmt  tmpl/list-add.fmg tmpl/list-new.fmg
