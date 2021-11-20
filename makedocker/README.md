make a docker image, called "pt2", that includes

- node.js
- python
- swipl
- emacs

App sources are put in /app/... .

App scripts are put in /app/appbin.

Node_modules is created in /app to include "atob", "pako" and "ohm-js"

Use `./make.bash` to build this Docker image.

Use `./run.bash` to run a bash shell in this image (and to access the tools).
