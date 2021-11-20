#!/bin/bash

cp pfr ${HOME}/app/bin
chmod a+x ${HOME}/app/bin/pfr
cp pf ${HOME}/app/bin
chmod a+x ${HOME}/app/bin/pfr

pfr test.txt test.ohm test.glue support.js
pfr test2.txt test2.ohm test2.glue support.js
pfr test2.txt test2.ohm test2a.glue support.js
pfr test3.txt test4.ohm test4.glue support.js

echo
echo '*** pf ***'
pf  test3.txt test3.ohm support.js
