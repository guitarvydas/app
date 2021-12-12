../make.bash

querydisplay3 component >layerfinal_query.bash
chmod a+x layerfinal_query.bash
echo '-- layerfinal_query.bash generated --' 1>&2

cp ../das2f/fb.pl .


# Layer Final. Components - bring it all home
echo '** layer final **' 1>&2
./layerfinal_query.bash >out.json

python3 test.py


