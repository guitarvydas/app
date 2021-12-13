./build.bash

echo use run.bash, quitting
exit 1

das2f helloworld >fb.pl
das2j helloworld >out.json
ls -l out.json
