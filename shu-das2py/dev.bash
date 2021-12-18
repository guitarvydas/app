#!/bin/bash
clear
../make.bash
#das2j helloworld >out.json
python3 emit.py
echo
cat hello.py
echo
cat world.py
echo
cat helloworld.py

echo '** running helloworld.'
chmod a+x helloworld.py
./helloworld.py
