FROM debian:stretch-slim

COPY detect-apt-proxy.sh /usr/bin

RUN chmod +x /usr/bin/detect-apt-proxy.sh \
    && echo 'Acquire::http::ProxyAutoDetect "/usr/bin/detect-apt-proxy.sh";' \
       | tee /etc/apt/apt.conf.d/00aptproxy

RUN apt-get update \
    && apt-get -y install revelation mate-themes sudo \
    && rm -rf /var/lib/apt/lists/*
    
CMD [ "/usr/bin/revelation" ]

