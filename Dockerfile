FROM python:alpine

ENV JOBS=100

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh
EXPOSE 8888
RUN apk --no-cache add --update \
      curl \
      gcc \
      musl-dev \
      git \
      ca-certificates \
      openssl \
    && pip install \
         aiohttp \
         aiodns \
         maxminddb \
    && pip install -U git+https://github.com/constverum/ProxyBroker.git \
    && rm -rf /root/..?* /root/.[!.]* /root/* /tmp/*

VOLUME /opt

WORKDIR /opt

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
