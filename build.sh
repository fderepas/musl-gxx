#!/bin/bash
# build the docker image
set -x
set -e
cd `dirname $0`
make dl
docker build --rm --no-cache -t $(basename `pwd`):`date +"%Y%m%d"`  -t $(basename `pwd`):latest .


