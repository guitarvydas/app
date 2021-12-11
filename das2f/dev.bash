../make.bash

# # pre forall.ohm forall.glue <layerkind.md >preprocessed_layerkind.md
# # querydisplay2 preprocessed_layerkind >layerkind_query.bash
# # chmod a+x layerkind_query.bash
# # echo '-- layerkind_query.bash generated --'

# ./make.bash
# # ./run-fb-pipeline.bash
# # # # ./dev0.bash

# echo pre
# pre "#+ forall" forall.ohm forall.glue <layerkind.md >preprocessed_layerkind.md
# echo qd3
# querydisplay3 preprocessed_layerkind >layerkind_query.bash
# chmod a+x layerkind_query.bash
# echo '-- layerkind_query.bash generated --'

# echo new version kind 1
# pre "#+ forall " "#+ " forall.ohm forall.glue <layerkind.md >preprocessed_layerkind.md
# echo new version kind 2
# querydisplay3 preprocessed_layerkind >layerkind_query.bash
# chmod a+x layerkind_query.bash
# echo '-- layerkind_query.bash generated --'

# echo new version for color 1
# pre  "#+ forall" "#+ " forall.ohm forall.glue <layercolor.md >preprocessed_layercolor.md
# echo new version for color 2
# querydisplay3 preprocessed_layercolor >layercolor_query.bash
# chmod a+x layercolor_query.bash
# echo '-- layercolor_query.bash generated --'

# ./make.bash
# ./run-fb-pipeline.bash

# echo pre
# pre  "#+ forall " "#+ " forall.ohm forall.glue <layerdirection.md >preprocessed_layerdirection.md
# echo qd3
# querydisplay3 preprocessed_layerdirection >layerdirection_query.bash
# chmod a+x layerdirection_query.bash
# echo '-- layerdirection_query.bash generated --'

./make.bash
./run-fb-pipeline.bash
