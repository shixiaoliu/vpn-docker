ARG RESTY_IMAGE_BASE="alpine"
ARG RESTY_IMAGE_TAG="latest"

FROM ${RESTY_IMAGE_BASE}:${RESTY_IMAGE_TAG}

RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add bash curl ip6tables iptables openvpn \
                shadow tini && addgroup -S vpn && mkdir /root/openvpn && rm -rf /tmp/*
COPY client-local.ovpn /root/openvpn/server.ovpn
COPY passwd /root/openvpn/passwd
COPY entrypoint.sh /root/openvpn/entrypoint.sh
RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf  && sysctl -p
ENTRYPOINT ["/sbin/tini", "--", "/root/openvpn/entrypoint.sh"]
