# # # pfr forall.txt forall.ohm forall.glue support.js
cdir=`pwd`
# # node pre.js forall.ohm forall.glue $cdir/support.js <in.txt
# app=${HOME}/app
# ${app}/make.bash
# pre '"/^#+ forall .*$/"' forall.ohm forall.glue <in.txt

## pre2 (with trigger RE)
## node junk.js '/^#+ forall .*$/' forall.ohm forall.glue ${cdir}/support.js <in.txt
# node pre.js '#+ forall ' forall.ohm forall.glue $cdir/support.js <in.txt
# negative case:: node pre.js '#+ xyz ' forall.ohm forall.glue $cdir/support.js <in.txt

# app=${HOME}/app
# ${app}/make.bash
# pre '#+ forall ' forall.ohm forall.glue $cdir/support.js <in.txt

echo forall
node pre.js '#+ forall ' forall.ohm forall.glue ${cdir}/support.js <in.txt >temp
echo design rule
node pre.js '#+ design rule ' designrule.ohm designrule.glue ${cdir}/support.js <temp


