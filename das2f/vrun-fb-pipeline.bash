# usage: run-fb-pipeline.bash pipe

echo '** factbase pipeline **' 1>&2

# Layer 0. Convert helloword.drawio into factbase format using d2f.
echo '** layer 0 (helloworld.drawio --> fb.pl) **'
d2f helloworld >fb.pl

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

# # # # Layer 3. Containment relationships.
echo '** layer 3 **'
./layer3 1>&2 #<<>>fb.pl