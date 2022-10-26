FROM ubuntu:18.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

ARG target_file=/tmp/rustup.rs
RUN apt-get update \
	&& apt-get -y install  curl\
	&& curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o $target_file \
	&& chmod +x $target_file \
	&& $target_file -y \
	&& source "$HOME/.cargo/env"


# build 
# docker build -t ubuntu-rust-dev -f ./assets/docker/ubuntu18.04-rust-dev.Dockerfile .

# run
# docker run --rm -it ubuntu-rust-dev 

# verify in docker
# docker run --rm ubuntu-rust-dev rustc --version

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 