FROM ubuntu:focal
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="Europe/London"
ENV LOG=0

RUN apt-get -y update \
    && apt-get -y install curl dante-server wireguard-tools iproute2 procps iptables openresolv kmod gnupg net-tools \
    && apt-get -qq autoremove --purge && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /run/entrypoint.sh
ENTRYPOINT ["/run/entrypoint.sh"]

STOPSIGNAL SIGQUIT
