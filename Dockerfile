FROM debian:stretch-slim

RUN echo 'Acquire::http::Proxy "http://172.17.0.1:3142";' > /etc/apt/apt.conf.d/00aptproxy

RUN apt-get update \
    && apt-get -y install sudo mate-themes revelation \
    && rm -rf /var/lib/apt/lists/*

CMD [ "/usr/bin/revelation" ]

