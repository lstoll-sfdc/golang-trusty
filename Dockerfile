FROM ubuntu:trusty

RUN apt-get update && \
    apt-get install -y software-properties-common curl build-essential

RUN add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get update

RUN apt-get install -y gcc-4.9 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9``

RUN curl -sLo /tmp/go1.15.15.tgz https://storage.googleapis.com/golang/go1.15.15.linux-amd64.tar.gz && \
    echo "0885cf046a9f099e260d98d9ec5d19ea9328f34c8dc4956e1d3cd87daaddb345  /tmp/go1.15.15.tgz" | sha256sum -c - && \
    mkdir -p /usr/local/bootstrap-go && \
    tar -C /usr/local/bootstrap-go -xzf /tmp/go1.15.15.tgz && \
    rm /tmp/go1.15.15.tgz
