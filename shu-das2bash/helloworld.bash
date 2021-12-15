# helloworld.bash
conn0=conn0_$RANDOM
mkfifo ${conn0}
{'receiver': {'component': 'world', 'port': 'in'}, 'sender': {'component': 'hello', 'port': 'out'}}
<class 'dict'>
hello
world
 sender=/hello/ type(sender)=/<class 'str'>/
{'hello': '${conn0}'}
{'world': '${conn0}'}
./world 3<${conn0}  &
./hello 4>${conn0}  &
