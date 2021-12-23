./build.bash

# echo use run.bash, quitting
# exit 1

das2j helloworld >out.json
grep connection out.json
ls -l out.json
