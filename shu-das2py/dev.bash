#!/bin/bash
clear
../make.bash
./sampletop.py

# #das2j helloworld >out.json
# ./emit.py sample.json helloworld
# # echo
# # cat hello.py
# # echo
# # cat world.py
# echo
# cat helloworld.py

# # echo '** running top.'
# # chmod a+x top.py
# # ./top.py

./emit.py sample.json hellworld
diff -w top.py sampletop.py

