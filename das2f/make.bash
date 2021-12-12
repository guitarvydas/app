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

querydisplay3 layerallcontains >layerallcontains_query.bash
chmod a+x layerallcontains_query.bash
echo '-- layerallcontains_query.bash generated --' 1>&2

querydisplay3 contains_port >layer4_query.bash
chmod a+x layer4_query.bash
echo '-- layer4_query.bash generated --' 1>&2

querydisplay3 indirect_contains >layer5_query.bash
chmod a+x layer5_query.bash
echo '-- layer5_query.bash generated --' 1>&2

setquerydisplay direct_contains >layer6_query.bash
chmod a+x layer6_query.bash
echo '-- layer6_query.bash generated --' 1>&2

querydisplay3 contains_edge >layeredgecontainment_query.bash
chmod a+x layeredgecontainment_query.bash
echo '-- layeredgecontainment_query.bash generated --' 1>&2

querydisplay3 synccode >layersynccode_query.bash
chmod a+x layersynccode_query.bash
echo '-- layersynccode_query.bash generated --' 1>&2

querydisplay3 connection >layerconnection_query.bash
chmod a+x layerconnection_query.bash
echo '-- layerconnection_query.bash generated --' 1>&2

querydisplay3 component >layerfinal_query.bash
chmod a+x layerfinal_query.bash
echo '-- layerfinal_query.bash generated --' 1>&2

pre '#+ forall ' '#+ ' forall.ohm forall.glue <layerkind.md >preprocessed_layerkind.md
querydisplay3 preprocessed_layerkind >layerkind_query.bash
chmod a+x layerkind_query.bash
echo '-- layerkind_query.bash generated --' 1>&2

pre  "#+ forall " "#+ " forall.ohm forall.glue <layercolor.md >preprocessed_layercolor.md
querydisplay3 preprocessed_layercolor >layercolor_query.bash
chmod a+x layercolor_query.bash
echo '-- layercolor_query.bash generated --' 1>&2

querydisplay3 layername >layername_query.bash
chmod a+x layername_query.bash
echo '-- layername_query.bash generated --' 1>&2

querydisplay3 layerboundingbox >layerboundingbox_query.bash
chmod a+x layerboundingbox_query.bash
echo '-- layerboundingbox_query.bash generated --' 1>&2

pre  "#+ forall " "#+ " forall.ohm forall.glue <layerdirection.md >preprocessed_layerdirection.md
querydisplay3 preprocessed_layerdirection >layerdirection_query.bash
chmod a+x layerdirection_query.bash
echo '-- layerdirection_query.bash generated --' 1>&2

baton1=baton
rm -f ${baton1} && mkfifo ${baton1}
