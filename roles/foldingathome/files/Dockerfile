FROM ubuntu:focal

ENV FAH_VERSION_MINOR=7.6
ENV FAH_VERSION_PATCH=21

RUN useradd --create-home --home-dir /fahclient fahclient && \
    \
    apt update && \
    apt upgrade --yes && \
    apt install --yes wget ocl-icd-opencl-dev ocl-icd-libopencl1 && \
    \
    mkdir -p /tmp/fah && \
    wget https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v${FAH_VERSION_MINOR}/fahclient_${FAH_VERSION_MINOR}.${FAH_VERSION_PATCH}_amd64.deb -O /tmp/fah/fahclient_${FAH_VERSION_MINOR}.${FAH_VERSION_PATCH}_amd64.deb &&\
    mkdir -p /etc/fahclient && \
    touch /etc/fahclient/config.xml && \
    DEBIAN_FRONTEND=noninteractive dpkg --force-depends --install /tmp/fah/fahclient_${FAH_VERSION_MINOR}.${FAH_VERSION_PATCH}_amd64.deb && \
    \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ && \
    rm -rf /tmp/fah

USER fahclient
WORKDIR /fahclient

COPY --chown=fahclient:fahclient config.xml /etc/fahclient/config.xml

ENTRYPOINT [ "/usr/bin/FAHClient", "/etc/fahclient/config.xml", "--run-as", "fahclient", "--power", "full" ]
