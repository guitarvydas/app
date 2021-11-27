./generate.bash
baton=baton_${RANDOM}
./vrun-fb-pipeline.bash 3>${baton}

# receivers
(read baton ; querydisplay view1 ; echo done 1>&3 ) 3>${baton} &
pid1=$!
(read baton ; querydisplay view2 ; echo done 1>&3 ) 3>${baton} &
pid2=$!
wait ${pid1}
wait ${pid2}

