# helloworld.bash
conn0=conn0_$RANDOM
mkfifo ${conn0}
./world.bash 3<${conn0}  &
./hello.bash 4>${conn0}  &
