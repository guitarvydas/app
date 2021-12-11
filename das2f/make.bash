# views
querydisplay view0 >view0.bash
chmod a+x view0.bash
echo '-- view0.bash generated --'

querydisplay view0b >view0b.bash
chmod a+x view0b.bash
echo '-- view0b.bash generated --'

querydisplay view0b >view0b.bash
chmod a+x view0b.bash
echo '-- view0c.bash generated --'

querydisplay view1 >view1.bash
chmod a+x view1.bash
echo '-- view1.bash generated --'

querydisplay view2 >view2.bash
chmod a+x view2.bash
echo '-- view2.bash generated --'

querydisplay view3 >view3.bash
chmod a+x view3.bash
echo '-- view3.bash generated --'


# queries

querydisplay3 layer3 >layer3_query.bash
chmod a+x layer3_query.bash
echo '-- layer3_query.bash generated --'

querydisplay3 contains_port >layer4_query.bash
chmod a+x layer4_query.bash
echo '-- layer4_query.bash generated --'

querydisplay3 indirect_contains >layer5_query.bash
chmod a+x layer5_query.bash
echo '-- layer5_query.bash generated --'

setquerydisplay direct_contains >layer6_query.bash
chmod a+x layer6_query.bash
echo '-- layer6_query.bash generated --'

querydisplay3 contains_edge >layeredgecontainment_query.bash
chmod a+x layeredgecontainment_query.bash
echo '-- layeredgecontainment_query.bash generated --'

querydisplay3 synccode >layersynccode_query.bash
chmod a+x layersynccode_query.bash
echo '-- layersynccode_query.bash generated --'

querydisplay3 connection >layerconnection_query.bash
chmod a+x layerconnection_query.bash
echo '-- layerconnection_query.bash generated --'

querydisplay3 component >layerfinal_query.bash
chmod a+x layerfinal_query.bash
echo '-- layerfinal_query.bash generated --'

pre '#+ forall ' '#+ ' forall.ohm forall.glue <layerkind.md >preprocessed_layerkind.md
querydisplay3 preprocessed_layerkind >layerkind_query.bash
chmod a+x layerkind_query.bash
echo '-- layerkind_query.bash generated --'

pre  "#+ forall " "#+ " forall.ohm forall.glue <layercolor.md >preprocessed_layercolor.md
querydisplay3 preprocessed_layercolor >layercolor_query.bash
chmod a+x layercolor_query.bash
echo '-- layercolor_query.bash generated --'

querydisplay3 layername >layername_query.bash
chmod a+x layername_query.bash
echo '-- layername_query.bash generated --'

querydisplay3 layerboundingbox >layerboundingbox_query.bash
chmod a+x layerboundingbox_query.bash
echo '-- layerboundingbox_query.bash generated --'

querydisplay3 layerdirection >layerdirection_query.bash
chmod a+x layerdirection_query.bash
echo '-- layerdirection_query.bash generated --'

baton1=baton
rm -f ${baton1} && mkfifo ${baton1}

