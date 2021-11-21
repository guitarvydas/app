# Layer 0. Convert helloword.drawio into factbase format using d2f.
d2f helloworld >fb.pl

# We will store the factbase in a file called fb.pl
# We will augment fb.pl in each step along the way.
# Future: we might be able to rewrite this script to use a pipeline instead of intermediate files (e.g. fb.pl)


# Layer 1. Infer low-hanging fruit information.
./layer1 #<fb.pl >fb.pl

# # Layer 2. Names
./layer2 #<fb.pl >fb.pl
# # Layer 3. Containment relationships.
# ./containment #<fb.pl >fb.pl

