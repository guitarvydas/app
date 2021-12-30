echo use run.bash instead
exit 1

../make.bash
cwd=`pwd`
das2fdir=`pwd`
temp=temp_${RANDOM}

plpath=./
dr=~/projects/dr
mdfile=${dr}/dr-edgecontainment.md
fname=`basename -s '.md' $mdfile`
prep "cond\n" "endcond\n" ${dr}/cond.ohm ${dr}/cond.glue --inclusive --stop=1 --support=${dr}/drsupport.js <$mdfile >$temp
prep "." "$" ${dr}/designrule.ohm ${dr}/designrulea.glue --stop=1 --support=${dr}/drsupport.js --PLPATH=$plpath<$temp >a-$fname
prep "." "$" ${dr}/designrule.ohm ${dr}/designruleb.glue --stop=1 --support=${dr}/drsupport.js <$mdfile >b-$fname
chmod a+x a-$fname
chmod a+x b-$fname
echo '-- ' "design rules a-${fname} and b-${fname} generated" ' --' 1>&2

./a-${fname} | ./b-${fname} 2> $temp
#./a-${fname}

#./check-errors.bash
if grep -q failure <$temp
then
    echo
    cat $temp 1>&2
    echo quitting 1>&2
    rm $temp
    exit 1
fi
rm $temp
