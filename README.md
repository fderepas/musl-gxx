# musl-gxx
Source to build a docker image under alpine with development tools.

The created image enables to cross compile c/c++ code to alpine dockers.

## how to create
To create the docker image:
```
make
```

## how to use

Here is how to use this docker image to cross compile to musl.
Given a script `compile_alpine.sh`:
```
#!/bin/sh
# this script is to be run from an alpine docker image with compilers
set -e
set -x
if [ "$#" -ne 1 ]; then
    echo "You must enter the UID under which to generate files"
    exit 1
fi
cd /mnt
make # cross compiles for musl
```
I can be invoked via the command:
```
docker run -it --mount \
   type=bind,source=/path_to_invoke_compilation_script,target=/mnt \
   --workdir /mnt/src \
   --name musl-gxx --rm \
   musl-gxx:latest /bin/sh /mnt/compile_alpine.sh
```