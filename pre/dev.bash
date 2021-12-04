# # pfr forall.txt forall.ohm forall.glue support.js
# cdir=`pwd`
# node pre.js forall.ohm forall.glue $cdir/support.js <in.txt

app=${HOME}/app
${app}/make.bash
pre in.txt
