../make.bash
cwd=`pwd`
(cd ../das2f ; ./run.bash)
cd ${cwd}
cp ../das2f/fb.pl .
cp ../das2f/connection.pl .


querydisplay3 component >layerfinal_query.bash
chmod a+x layerfinal_query.bash
echo '-- layerfinal_query.bash generated --' 1>&2



# Layer Final. Components - bring it all home
echo '** layer final **' 1>&2
./layerfinal_query.bash >out.json

python3 test.py


