# views
querydisplay view0 >view0.bash
chmod a+x view0.bash
echo '-- view0.bash generated --' 1>&2

querydisplay view0b >view0b.bash
chmod a+x view0b.bash
echo '-- view0b.bash generated --' 1>&2

querydisplay view0b >view0b.bash
chmod a+x view0b.bash
echo '-- view0c.bash generated --' 1>&2

querydisplay view1 >view1.bash
chmod a+x view1.bash
echo '-- view1.bash generated --' 1>&2

querydisplay view2 >view2.bash
chmod a+x view2.bash
echo '-- view2.bash generated --' 1>&2

querydisplay view3 >view3.bash
chmod a+x view3.bash
echo '-- view3.bash generated --' 1>&2


# queries

das2fdir=`pwd`

pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue <layerallcontains.md >preprocessed_layerallcontains.md
querydisplay3 preprocessed_layerallcontains --prefix="${das2fdir}/" >layerallcontains_query.bash
chmod a+x layerallcontains_query.bash
echo '-- layerallcontains_query.bash generated --' 1>&2

pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue <contains_port.md >preprocessed_contains_port.md
querydisplay3  preprocessed_contains_port  --prefix="${das2fdir}/" >layer4_query.bash
chmod a+x layer4_query.bash
echo '-- layer4_query.bash generated --' 1>&2

pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue <indirect_contains.md >preprocessed_indirect_contains.md
querydisplay3  preprocessed_indirect_contains  --prefix="${das2fdir}/" >layer5_query.bash
chmod a+x layer5_query.bash
echo '-- layer5_query.bash generated --' 1>&2

pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue <direct_contains.md >preprocessed_direct_contains.md
setquerydisplay preprocessed_direct_contains  --prefix="${das2fdir}/" >layer6_query.bash
chmod a+x layer6_query.bash
echo '-- layer6_query.bash generated --' 1>&2

pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue <contains_edge.md >preprocessed_contains_edge.md
querydisplay3   preprocessed_contains_edge --prefix="${das2fdir}/" >layeredgecontainment_query.bash
chmod a+x layeredgecontainment_query.bash
echo '-- layeredgecontainment_query.bash generated --' 1>&2

querydisplay3  synccode --prefix="${das2fdir}/"  >layersynccode_query.bash
chmod a+x layersynccode_query.bash
echo '-- layersynccode_query.bash generated --' 1>&2

querydisplay3  connection --prefix="${das2fdir}/"  >layerconnection_query.bash
chmod a+x layerconnection_query.bash
echo '-- layerconnection_query.bash generated --' 1>&2

pre '#+ forall ' '#+ ' forall.ohm forall.glue <layerkind.md >preprocessed_layerkind.md
querydisplay3  preprocessed_layerkind --prefix="${das2fdir}/"  >layerkind_query.bash
chmod a+x layerkind_query.bash
echo '-- layerkind_query.bash generated --' 1>&2

pre  "#+ forall " "#+ " forall.ohm forall.glue <layercolor.md >preprocessed_layercolor.md
querydisplay3   preprocessed_layercolor --prefix="${das2fdir}/" >layercolor_query.bash
chmod a+x layercolor_query.bash
echo '-- layercolor_query.bash generated --' 1>&2

querydisplay3  layername --prefix="${das2fdir}/"  >layername_query.bash
chmod a+x layername_query.bash
echo '-- layername_query.bash generated --' 1>&2

querydisplay3  layerboundingbox --prefix="${das2fdir}/"  >layerboundingbox_query.bash
chmod a+x layerboundingbox_query.bash
echo '-- layerboundingbox_query.bash generated --' 1>&2

pre  "#+ forall " "#+ " forall.ohm forall.glue <layerdirection.md >preprocessed_layerdirection.md
querydisplay3   preprocessed_layerdirection --prefix="${das2fdir}/" >layerdirection_query.bash
chmod a+x layerdirection_query.bash
echo '-- layerdirection_query.bash generated --' 1>&2

baton1=baton
rm -f ${baton1} && mkfifo ${baton1}

