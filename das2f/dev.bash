../make.bash

# pre forall.ohm forall.glue <layerkind.md >preprocessed_layerkind.md
# querydisplay2 preprocessed_layerkind >layerkind_query.bash
# chmod a+x layerkind_query.bash
# echo '-- layerkind_query.bash generated --'

./make.bash
./run-fb-pipeline.bash
# # ./dev0.bash
