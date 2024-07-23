ARG VARIANT="ubuntu-20.04"
FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install --no-install-recommends \
        cmake \
        build-essential \
        wget \
        ca-certificates \
        gdb-multiarch \
        binutils-multiarch \
        automake \
        autoconf \
        libtool \
        libftdi-dev \
        libusb-1.0-0-dev \
        pkg-config \
        clang-format \
        python3 \
        python3-tk

WORKDIR /apps

#RUN cd /apps && \
#    git clone -b master https://github.com/raspberrypi/pico-sdk.git --depth=1 && \
#    cd pico-sdk && \
#    git submodule update --init
#ENV PICO_SDK_PATH=/apps/pico-sdk

RUN mkdir -p /home/vscode/Arduino/hardware/pico && \
    git clone https://github.com/earlephilhower/arduino-pico.git /home/vscode/Arduino/hardware/pico/rp2040 && \
    cd /home/vscode/Arduino/hardware/pico/rp2040 && \
    git submodule update --init && \
    cd pico-sdk && \
    git submodule update --init && \
    cd ../tools && \
    python3 ./get.py
RUN cd /apps && \
    ln -s /home/vscode/Arduino/hardware/pico/rp2040/pico-sdk pico-sdk
ENV PICO_SDK_PATH=/apps/pico-sdk

RUN cd /apps && \
    git clone -b master https://github.com/raspberrypi/pico-extras.git --depth=1 && \
    cd pico-extras && \
    git submodule update --init 
ENV PICO_EXTRAS_PATH=/apps/pico-extras

RUN cd /apps && \
    git clone https://github.com/codaris/picovga-cmake.git pico-vga
ENV PICOVGA_PATH=/apps/pico-vga

RUN mkdir /home/vscode/.local && \
    mkdir /home/vscode/.local/bin && \
    curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/home/vscode/.local/bin sh
