# # # pfr forall.txt forall.ohm forall.glue support.js
cdir=`pwd`
# # node pre.js forall.ohm forall.glue $cdir/support.js <in.txt
# app=${HOME}/app
# ${app}/make.bash
# pre '"/^#+ forall .*$/"' forall.ohm forall.glue <in.txt

## pre2 (with trigger RE)
# node junk.js '/^#+ forall .*$/' forall.ohm forall.glue ${cdir}/support.js <in.txt
node pre.js '#+ forall ' forall.ohm forall.glue $cdir/support.js <in.txt
