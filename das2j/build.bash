../make.bash
cwd=`pwd`
#(cd ../das2f ; ./run.bash)
cd ${cwd}
cp ../das2f/fb.pl .
cp ../das2f/connection.pl .
cp ../das2f/component_helper.pl .


querydisplay3 component --prefix="${cwd}/" >layerfinal_query.bash
chmod a+x layerfinal_query.bash
echo '-- layerfinal_query.bash generated --' 1>&2


