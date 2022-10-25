FROM ubuntu:18.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

RUN apt update

RUN apt-get install -y gcc g++ binutils patch bzip2 flex bison make autoconf gettext texinfo unzip sharutils subversion libncurses5-dev ncurses-term zlib1g-dev libssl-dev  gawk wget python git xz-utils

ENTRYPOINT ["/bin/bash"]

# build 
# docker build -t ubuntu18.04-openwrt-18.06-build -f ./assets/docker/ubuntu18.04-openwrt-18.06-build.Dockerfile .

# run
# docker run --rm -it ubuntu18.04-openwrt-18.06-build

# verify
#
