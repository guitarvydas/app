# usage: run-fb-pipeline.bash pipe
das2fdir=${HOME}/app/das2f

echo '** factbase pipeline **' 1>&2

# Layer 0. Convert helloword.drawio into factbase format using d2f.
echo '** layer 0 (helloworld.drawio --> fb.pl) **' 1>&2
d2f $1 >fb.pl

# We will store the factbase in a file called fb.pl
# We will augment fb.pl in each step along the way.
# Future: we might be able to rewrite this script to use a pipeline instead of intermediate files (e.g. fb.pl)


# Layer 1. Infer low-hanging fruit information.
echo '** layer 1 **' 1>&2
${das2fdir}/layerkind ${das2fdir} 1>&2 # <<>>fb.pl
${das2fdir}/layername ${das2fdir} 1>&2 # <<>>fb.pl
${das2fdir}/layercolor ${das2fdir} 1>&2 # <<>>fb.pl
${das2fdir}/layerboundingbox ${das2fdir} 1>&2 # <<>>fb.pl

set -x
# # Layer 2. Names, port directions
echo '** layer 2 **' 1>&2
${das2fdir}/layerdirection ${das2fdir} 1>&2 # <<>>fb.pl
#${das2fdir}/layer2  1>&2 #<<>>fb.pl

# # Design Rule - all ports (ellipses) must have a direction
# echo '** design rule for layer 2 **'
# ./design_rule_layer2  1>&2


#./check-errors.bash
grep FATAL <fb.pl
if grep -q FATAL <fb.pl
then
    echo quitting
    exit 1
fi

# Layer 3. Rectangle Containment relationships.
echo '** layer all contains **'  1>&2
${das2fdir}/layerallcontains ${das2fdir} 1>&2 #<<>>fb.pl


# Layer 4. Rectangle contains Port.
echo '** layer 4 **' 1>&2
${das2fdir}/layer4 ${das2fdir} 1>&2 #<<>>fb.pl

# Layer 5. indirect containment
echo '** layer 5 - indirect containment **' 1>&2
${das2fdir}/layer5 ${das2fdir} 1>&2 #<<>>fb.pl

# Layer 6. direct containment
echo '** layer 6 - direct containment **' 1>&2
${das2fdir}/layer6 ${das2fdir} 1>&2 #<<>>fb.pl

# Layer edge containment
echo '** layer edge containment **' 1>&2
${das2fdir}/layeredgecontainment ${das2fdir} 1>&2 #<<>>fb.pl

# Layer Synccode.
echo '** layer synccode **' 1>&2
${das2fdir}/layersynccode ${das2fdir} 1>&2 #<<>>fb.pl

# Layer Connections.
echo '** layer connections **' 1>&2
${das2fdir}/layerconnection ${das2fdir} 1>&2 #<<>>fb.pl
