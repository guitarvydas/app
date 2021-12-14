#!/bin/bash
../make.bash
das2j helloworld >escaped-out.json
python3 unescape.py
python3 emit.py
echo
cat hello.bash
echo
cat world.bash


