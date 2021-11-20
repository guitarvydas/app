#!/bin/bash
pthome=~/
docker run -it -v "${pthome}:/app/pt" pt2
#docker exec --name ptrun -v "${dir}/:${dir}" pt2 $1 ${fullname} ${fullname2}
