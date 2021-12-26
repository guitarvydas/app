# pre '#+ forall ' '#+ ' forall.ohm forall.glue <layerkind.md >preprocessed_layerkind.md
#pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue <preprocessed_layerkind.md >preprocessed2_layerkind.md
#querydisplay3  preprocessed2_layerkind --prefix="${das2fdir}/"  >layerkind_query.bash
#chmod a+x layerkind_query.bash
#echo '-- layerkind_query.bash generated --' 1>&2

../make.bash
cwd=`pwd`
pre '#+ forall ' '#+ ' forall.ohm forall.glue ${cwd}/forall.support.js --support=${cwd}/forall.support.js <layerkind.md >preprocessed_layerkind.md
pre '#+ query' '#+ ' implicitforall.ohm implicitforall.glue --support=${cwd}/implicitforall.support.js --input=preprocessed_layerkind.md >temp
sed -E -e 's/~/query\n/g' <temp

# echo dev.bash obsolete, use run.bash, exiting
# exit 1
