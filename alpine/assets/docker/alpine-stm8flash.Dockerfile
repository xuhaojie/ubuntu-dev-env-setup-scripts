FROM alpine

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

# change apk source
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update

#RUN apk add stlink --update-cache --repository http://mirrors.ustc.edu.cn/alpine/v3.16/main --allow-untrusted

RUN apk add make gcc musl-dev libusb-dev git

ENV TARGET_DIR=/tmp/stm8flash

# fetch code
RUN git clone https://github.com/vdudouyt/stm8flash.git $TARGET_DIR

# change dir
WORKDIR $TARGET_DIR

# build
RUN make

# install
RUN make install

# clean
WORKDIR /
RUN rm -rf $TARGET_DIR

# build 
# docker build -t alpine-stm8flash -f ./assets/docker/alpine-stm8flash.Dockerfile .

# run
# docker run --rm -it --device /dev/mem:/dev/men --cap-add SYS_RAWIO alpine-stm8flash 

# verify in docker
# stm8flash -V

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 