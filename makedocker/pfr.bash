wdir=`dirname ~/quicklisp/local-projects/play/tests/.`
bindir=`dirname ~/quicklisp/local-projects/makept/.`
set -x
docker run --name pt-pfr --rm -v "${wdir}:/app" -v "${bindir}:/ptbin" pt /ptbin/pfr.bash /app/
