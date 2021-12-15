#!/bin/bash
# this is only an example
# use das2j instead

./build.bash
cp ../das2f/fb.pl .

# # Layer Final. Components - bring it all home
# echo '** layer final **' 1>&2
# ./layerfinal_query.bash >out.json
das2j helloworld >out.json

python3 test.py


