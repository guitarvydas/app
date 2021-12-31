#!/bin/bash
clear
../make.bash
# das2j helloworld >out.json
cwd=`pwd`
#pfr sample.json component.ohm component.glue --support=${cwd}/support.js --tracing
pfr sample.json component.ohm component.glue --support=${cwd}/support.js




