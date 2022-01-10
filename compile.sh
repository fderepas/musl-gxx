#!/bin/sh
# this script is to be run from an alpine docker image with compilers
set -e
set -x


# fastcgipp files
cd fastcgipp-master 
mkdir -p fastcgi++.build 
cd fastcgi++.build 
cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=RELEASE ../ 
make
make install
cd ../..

# mariadb
cd mariadb-connector-c
mkdir -p build
cd build
cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/
make
make install
cd ../..
