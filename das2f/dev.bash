# ../make.bash

# # # pre forall.ohm forall.glue <layerkind.md >preprocessed_layerkind.md
# # # querydisplay2 preprocessed_layerkind >layerkind_query.bash
# # # chmod a+x layerkind_query.bash
# # # echo '-- layerkind_query.bash generated --'

# # ./make.bash
# # # ./run-fb-pipeline.bash
# # # # # ./dev0.bash

# # echo pre
# # pre "#+ forall" forall.ohm forall.glue <layerkind.md >preprocessed_layerkind.md
# # echo qd3
# # querydisplay3 preprocessed_layerkind >layerkind_query.bash
# # chmod a+x layerkind_query.bash
# # echo '-- layerkind_query.bash generated --'

# # echo new version kind 1
# # pre "#+ forall " "#+ " forall.ohm forall.glue <layerkind.md >preprocessed_layerkind.md
# # echo new version kind 2
# # querydisplay3 preprocessed_layerkind >layerkind_query.bash
# # chmod a+x layerkind_query.bash
# # echo '-- layerkind_query.bash generated --'

# # echo new version for color 1
# # pre  "#+ forall" "#+ " forall.ohm forall.glue <layercolor.md >preprocessed_layercolor.md
# # echo new version for color 2
# # querydisplay3 preprocessed_layercolor >layercolor_query.bash
# # chmod a+x layercolor_query.bash
# # echo '-- layercolor_query.bash generated --'

# # ./make.bash
# # ./run-fb-pipeline.bash

# # echo pre
# # pre  "#+ forall " "#+ " forall.ohm forall.glue <layerdirection.md >preprocessed_layerdirection.md
# # echo qd3
# # querydisplay3 preprocessed_layerdirection >layerdirection_query.bash
# # chmod a+x layerdirection_query.bash
# # echo '-- layerdirection_query.bash generated --'

# # ./make.bash
# # #./run-fb-pipeline.bash

# # # Layer edge containment
# # echo '** layer edge containment **'
# # ./layeredgecontainment 1>&2 #<<>>fb.pl

# ./make.bash
# ./run-fb-pipeline.bash >out.json

cwd=`pwd`
das2fdir=$cwd

# pre '#+ forall ' '#+ ' forall.ohm forall.glue <layerkind.md >preprocessed_layerkind.md
# querydisplay3 preprocessed_layerkind >layerkind_query.bash
# chmod a+x layerkind_query.bash
# echo '-- layerkind_query.bash generated --' 1>&2
# ./layerkind $cwd

clear
../make.bash
# # Layer 3. Rectangle Containment relationships.
# querydisplay3 layerallcontains --prefix=$das2fdir >layerallcontains_query.bash
# # chmod a+x layerallcontains_query.bash
# # echo '-- layerallcontains_query.bash generated --' 1>&2
# # echo '** layer all contains **'  1>&2
# # ${das2fdir}/layerallcontains ${das2fdir} 1>&2 #<<>>fb.pl

das2fdir=`pwd`

# querydisplay3 layerallcontains --prefix=${das2fdir} >layerallcontains_query.bash
# chmod a+x layerallcontains_query.bash
# echo '-- layerallcontains_query.bash generated --' 1>&2
# cat layerallcontains_query.bash


# pre '#+ forall ' '#+ ' forall.ohm forall.glue <layerkind.md >preprocessed_layerkind.md
# querydisplay3 preprocessed_layerkind --prefix="${das2fdir}/" >layerkind_query.bash
# chmod a+x layerkind_query.bash
# echo '-- layerkind_query.bash generated --' 1>&2
# ${das2fdir}/layerkind ${das2fdir} 1>&2 # <<>>fb.pl

# setquerydisplay direct_contains  --prefix="${das2fdir}/" >layer6_query.bash
# chmod a+x layer6_query.bash
# echo '-- layer6_query.bash generated --' 1>&2
# cat layer6_query.bash

echo dev.bash deprecated, use run.bash, exiting
exit 1
