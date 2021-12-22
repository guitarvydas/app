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

./emit.py sample.json helloworld

sed -E -e 's/sample//g' <sampletop.py >temp.py
diff -w top.py temp.py

sed -E -e 's/sample//g' <samplehello.py >temp.py
diff -w hello.py temp.py

sed -E -e 's/sample//g' <sampleworld.py >temp.py
diff -w world.py temp.py

sed -E -e 's/sample//g' <samplehelloworld.py >temp.py
diff -w helloworld.py temp.py

