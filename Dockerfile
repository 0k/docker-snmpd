FROM debian:jessie
MAINTAINER Valentin Lab <valentin.lab@kalysto.org>

RUN echo "deb http://http.us.debian.org/debian jessie main non-free" >> /etc/apt/sources.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y --no-install-recommends snmpd snmp snmp-mibs-downloader && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#ADD entrypoint.sh /entrypoint.sh
#RUN chmod a+x /entrypoint.sh

#VOLUME /etc/snmp

EXPOSE 161

CMD ["-f", "-u", "snmp", "-g", "snmp", "-I", "-smux,mteTrigger,mteTriggerConf", "-p", "/run/snmpd.pid" ]
ENTRYPOINT ["/usr/sbin/snmpd"]
