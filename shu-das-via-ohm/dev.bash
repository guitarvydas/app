#!/bin/bash
clear
../make.bash
# das2j helloworld >out.json
cwd=`pwd`
pfr out.json component.ohm component.glue --support=${cwd}/support.js




