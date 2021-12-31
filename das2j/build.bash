../make.bash
cwd=`pwd`
#(cd ../das2f ; ./run.bash)
cd ${cwd}
das2fdir=../das2f


pre '#+ query ' '#+ ' ${das2fdir}/implicitforall.ohm ${das2fdir}/implicitforall.glue --support=${das2fdir}/implicitforall.support.js <component.md >preprocessed_layercomponent.md
querydisplay3 preprocessed_layercomponent --prefix="${cwd}/" >layercomponent_query.bash
chmod a+x layercomponent_query.bash
echo '-- layercomponent_query.bash generated --' 1>&2


