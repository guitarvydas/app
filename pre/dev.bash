# # # pfr forall.txt forall.ohm forall.glue support.js
app=${HOME}/app
${app}/make.bash
cdir=`pwd`
echo test1
pre 'a' 'c' test1.ohm test1.glue <test1
