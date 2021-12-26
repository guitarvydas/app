# # # pfr forall.txt forall.ohm forall.glue support.js
app=${HOME}/app
${app}/make.bash
cdir=`pwd`
echo running test1 '(should be *c)'
pre 'a' 'c' test1.ohm test1.glue --input=test1
#pre 'a' 'c' test1.ohm test1.glue <test1
echo running test2 '(should be *c)'
pre 'ab' 'c' test2.ohm test2.glue --input=test2
echo running test3 '(should be *c*c)'
pre 'ab' 'c' test2.ohm test2.glue --input=test3
echo running test4 '(should be ***c)'
pre 'ab' 'ab|c' test2.ohm test2.glue --input=test4
echo running test5 '(should be ***c)'
pre '.' '$' test5.ohm test5.glue --stop=1 --input=test5
echo running test forall
pre '#+ forall' '#+ ' forall.ohm forall.glue --input=testforall --support=${cdir}/support.js
echo running test implicit forall
pre '#+ query' '#+ ' implicitforall.ohm implicitforall.glue --input=testimplicitforall --support=${cdir}/support.js >temp
sed -E -e 's/~/query\n/g' <temp
