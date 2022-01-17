FROM ubuntu:20.04

ENV TZ=Asia/Beijing
# Set locale
ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8"

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /linux

RUN apt update && \
    apt install build-essential gcc gdb yasm nasm flex bison openssl libssl-dev libncurses-dev libelf-dev -y

ENTRYPOINT [ "bash", "/linux/buildKernel.sh" ]
