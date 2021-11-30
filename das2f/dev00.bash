./dev.bash

# run the inference pipeline once and leave result in fb.pl
# usage: run-fb-pipeline.bash pipe

echo '** factbase pipeline **' 1>&2

# Layer 0. Convert helloword.drawio into factbase format using d2f.
echo '** layer 0 (helloworld.drawio --> fb.pl) **'
d2f debug >fb.pl

# We will store the factbase in a file called fb.pl
# We will augment fb.pl in each step along the way.
# Future: we might be able to rewrite this script to use a pipeline instead of intermediate files (e.g. fb.pl)


# Layer 1. Infer low-hanging fruit information.
echo '** layer 1 **' 1>&2
./layer1  1>&2 #<<>>fb.pl

# # Layer 2. Names, port directions
echo '** layer 2 **' 1>&2
./layer2  1>&2 #<<>>fb.pl

# Design Rule - all ports (ellipses) must have a direction
echo '** design rule for layer 2 **'
./design_rule_layer2  1>&2


##########
# Layer 3. Rectangle Containment relationships.
echo '** layer 3 **'
# input from fb.pl
# output augments fb.pl
temp=_temp_${RANDOM}
temp2=_temp_${RANDOM}

### move result into fb.pl (without overwrite problems)
temp=temp_${RANDOM}

./layer3-body >layer3.temp
# cp layer3.temp ${temp}

# ./appendToFb ${temp}
# # cat $temp
# # cat fb.pl $temp >$temp2
# # mv $temp2 fb.pl

# rm -f ${temp}

# ##########

# # Layer 4. Rectangle contains Port.
# echo '** layer 4 **'
# ./layer4 1>&2 #<<>>fb.pl

echo
echo stopping in layer3 - generate facts but new facts not added to fb.pl
echo
cat layer3.temp


echo
echo running generated layer3
echo
./layer3_query.bash
