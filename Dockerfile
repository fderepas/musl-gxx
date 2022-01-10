FROM alpine:latest

RUN apk update
RUN apk add --update build-base make cmake
RUN apk add --update g++
RUN apk add --update libstdc++ unzip python2 openssl-dev openssl sudo
RUN apk add --update openssl-libs-static
RUN addgroup fab
RUN adduser -h /home/fab -g '' -s /bin/ash -G fab -D fab
RUN chown nobody:nogroup /mnt

WORKDIR /home/fab

# copy fastcgi sources in the docker
RUN mkdir -p /home/fab/fastcgipp-master
RUN chown fab:fab fastcgipp-master
COPY --chown=fab:fab fastcgipp-master/ /home/fab/fastcgipp-master

# copy mariadb client source code in the docker
RUN mkdir -p /home/fab/mariadb-connector-c
RUN chown fab:fab mariadb-connector-c
COPY --chown=fab:fab mariadb-connector-c/ /home/fab/mariadb-connector-c

# launch the compilation
COPY --chown=fab:fab compile.sh /home/fab/compile.sh
RUN ls -la
RUN /bin/sh compile.sh



