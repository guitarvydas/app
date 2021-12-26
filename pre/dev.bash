# # # pfr forall.txt forall.ohm forall.glue support.js
app=${HOME}/app
${app}/make.bash
cdir=`pwd`
echo running test1
pre 'a' 'c' test1.ohm test1.glue --input=test1
#pre 'a' 'c' test1.ohm test1.glue <test1
echo running test2
pre 'ab' 'c' test2.ohm test2.glue --input=test2
echo running test3
pre 'ab' 'c' test2.ohm test2.glue --input=test3
echo running test4
pre 'ab' 'ab|c' test2.ohm test2.glue --input=test4
