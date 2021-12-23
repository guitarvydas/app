../make.bash
cwd=`pwd`
#(cd ../das2f ; ./run.bash)
cd ${cwd}
cp ../das2f/connection.pl .
cp ../das2f/component_helper.pl .


querydisplay3 component --prefix="${cwd}/" >layercomponent_query.bash
chmod a+x layercomponent_query.bash
echo '-- layercomponent_query.bash generated --' 1>&2


