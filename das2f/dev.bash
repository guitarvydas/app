../make.bash

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

querydisplay2 layer3 >layer3_query.bash
chmod a+x layer3_query.bash
echo '-- layer3_query.bash generated --'

querydisplay2 contains_port >layer4_query.bash
chmod a+x layer4_query.bash
echo '-- layer4_query.bash generated --'

querydisplay2 contains_edge >layer4b_query.bash
chmod a+x layer4b_query.bash
echo '-- layer4b_query.bash generated --'

querydisplay2 indirect_contains >layer5_query.bash
chmod a+x layer5_query.bash
echo '-- layer5_query.bash generated --'

setquerydisplay direct_contains >layer6_query.bash
chmod a+x layer6_query.bash
echo '-- layer6_query.bash generated --'

querydisplay2 component >layer7_query.bash
chmod a+x layer7_query.bash
echo '-- layer7_query.bash generated --'

baton1=baton
rm -f ${baton1} && mkfifo ${baton1}

./dev0.bash
