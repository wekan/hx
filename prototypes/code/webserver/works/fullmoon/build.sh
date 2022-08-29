#!/bin/bash

curl -o redbean.com https://justine.lol/redbean/redbean-latest.com
chmod +x redbean.com
zip redbean.com .init.lua .lua/fullmoon.lua assets/styles.css
