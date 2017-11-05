FROM sameersbn/squid:latest
MAINTAINER bart@bamweb.nl

RUN apt-get update \
 && apt-get install -y squidguard 

ADD sample-configs /sample-configs
RUN mkdir /custom-config

ADD startSquidGuard /startSquidGuard
RUN chmod a+x /startSquidGuard

EXPOSE 3128
VOLUME ["/var/log/squid3"]
VOLUME ["/custom-config"]

CMD ["/startSquidGuard"]

