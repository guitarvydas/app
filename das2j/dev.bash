./build.bash

# Layer Final. Components - bring it all home
echo '** layer final **' 1>&2
./layerfinal_query.bash >out.json

python3 test.py


