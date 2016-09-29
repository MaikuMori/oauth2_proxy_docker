FROM alpine:3.4
MAINTAINER Miks Kalnins <mikskalnins@maikumori.com>
RUN apk add --no-cache --virtual .fetch-deps \
    ca-certificates \
    openssl \
    tar \
  && wget -O /oauth2_proxy.tar.gz https://github.com/bitly/oauth2_proxy/releases/download/v2.1/oauth2_proxy-2.1.linux-amd64.go1.6.tar.gz \
  && tar -fxz /oauth2_proxy.tar.gz \
  && rm /oauth2_proxy.tar.gz \
  && apk del .fetch-deps

ENTRYPOINT ["/oauth2_proxy"]
