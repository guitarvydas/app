#!/bin/bash
clear
echo 'use run.bash instead ; dev.bash is deprecated'
exit 1

#../make.bash
#das2j helloworld >out.json
python3 emit.py
echo
cat hello.bash
echo
cat world.bash
echo
cat helloworld.bash
echo NOT regenerating out.json


